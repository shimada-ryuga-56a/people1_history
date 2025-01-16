Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "static_pages#top"
  get "contact" => "static_pages#contact"
  get "in_progress" => "static_pages#in_progress"
  get '/visual_images/:id' => "events#image"
  get '/jacket/:id' => "songs#jacket"
  get '/version_jacket/:id' => "discs#jacket"
  get '/history_disc_dates/:id' => "histories#disc_date_image"
  get '/history_events/:id' => "histories#event_image"
  get '/history_histories/:id' => "histories#history_image"
  get '/history_tie_ups/:id' => "histories#tie_up_image"
  get '/history_link_dates/:id' => "histories#link_date_image"
  get '/history_link_views/:id' => "histories#link_view_image"
  get '/histories/images/:id' => "histories#show_page_image"

  # （ここから）Twitter認証以外を認めないようにルーティングを設定しようとした痕跡
  # devise_for :users, skip: :all

  # devise_scope :user do
  #   match '/users/auth/twitter', to: 'users/omniauth_callbacks#passthru', via: [:get, :post], as: :user_twitter_omniauth_authorize
  #   match '/users/auth/twitter/callback', to: 'users/omniauth_callbacks#twitter', via: [:get, :post], as: :user_twitter_omniauth_callback
  #   get '/users/sign_out' => 'users/sessions#destroy', as: :destroy_user_session
  # end

  # （ここまで）

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    # Twitter API認証用
    :omniauth_callbacks => 'users/omniauth_callbacks',
  }

  resources :notices, only: [:index]
  delete "notices" => "notices#destroy"

  resources :members, only: [:index]
  resources :histories, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    post "image/destroy" => "images#history_image_destroy"
    resources :informations, only: [:create], module: :histories
    resource :likes, only: [:create, :destroy], module: :histories
  end

  resources :discs, only: [:show] do
    resources :informations, only: [:create], module: :discs
  end

  resources :tours, only: [:show] do
    resources :tour_informations, only: [:create]
  end

  resources :informations, only: [] do
    resource :likes_on_informations, only: [:create, :destroy], shallow: true
  end

  resources :tour_informations, only: [] do
    resource :likes_on_tour_informations, only: [:create, :destroy], shallow: true
  end

  resources :songs, only: [:index, :show] do
    resources :song_informations, only: [:create, :destroy], shallow: true
  end

  resources :song_informations, only: [], shallow: true do
    resource :likes_on_song_informations, only: [:create, :destroy], shallow: true
  end

  resources :events, only: [:index, :show] do
    resources :event_informations, only: [:create]
    resources :event_bookmarks, only: [:create, :destroy], shallow: true
    resource :setlist, only: [:new, :create]
  end

  resources :event_informations, only: [], shallow: true do
    resource :likes_on_event_informations, only: [:create, :destroy], shallow: true
  end

  resources :event_informations, only: [], shallow: true do
    resource :likes_on_event_informations, only: [:create, :destroy], shallow: true
  end

  resources :setlistitem_informations, only: [:create] do
    resource :likes_on_setlistitem_informations, only: [:create, :destroy], shallow: true
  end

  resource :mypage, only: [:show]

  # セットリストのオートコンプリートのためのルーティング
  resources :setlists do
    get :search, on: :collection
  end

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
