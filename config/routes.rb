Rails.application.routes.draw do
  resources :sessions, only: [:index, :new, :create, :destroy]
  match 'login', to: 'sessions#new', via: [:get, :post]

  scope :memorials, :controller => 'memorials' do
    get :attended, :created
  end

  resources :memorials, only: [:index, :show]

  scope :info, :controller => 'info' do
    get :about, :contact, :team
  end

  resources :users, only: [:new, :create, :destroy]
  resources :facebook, only: [:create]

  namespace :admin do
    resources :memorials, except: [:index]
  end

  resources :posts, except: [:index]
  resources :photos, except: [:index, :edit, :update]
  resources :comments, except: [:index]

  match 'auth/:provider/callback', to: 'facebook#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
	match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  get 'auth/backdoor' if Rails.env.test?

  root "sessions#index"

  get 'admin_memorials', to: 'admin/memorials#show'
  get 'new_with_email', to: 'sessions#new_with_email'


  match "/callback", to: "memorials#show", via: [:get, :post]
end
