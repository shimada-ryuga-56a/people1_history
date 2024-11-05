Rails.application.routes.draw do
  root "static_pages#top"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    # Twitter API認証用
    :omniauth_callbacks => 'users/omniauth_callbacks',
  }

  resources :tours, only: [:index, :show]
  resources :songs, only: [:index, :show] do
    resources :song_informations, only: [:create, :destroy], shallow: true
  end

  resources :events, only: [:index, :show] do
    resource :setlist, only: [:new, :create]
  end

  resources :setlistitem_informations, only: [:create]

  # セットリストのオートコンプリートのためのルーティング
  resources :setlists do
    get :search, on: :collection
  end

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
