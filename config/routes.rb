Rails.application.routes.draw do
  root "static_pages#top"
  get "contact" => "static_pages#contact"
  get "in_progress" => "static_pages#in_progress"

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

  resources :discs, only: [:show]
  resources :members, only: [:index]
  resources :histories, only: [:index]

  resources :tours, only: [:show] do
    resources :tour_informations, only: [:create]
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
    resource :setlist, only: [:new, :create]
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
