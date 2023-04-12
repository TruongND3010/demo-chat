Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  get 'messages/index'
  get 'messages/create'
  get 'index/create'
  root to: 'users#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :rooms do
    collection do
      get '/:id', to: 'rooms#list_user', as: 'room_list_user'
    end

    resources :messages do
      collection do
        # get 'convention/user/:id', to: 'messages#index', as: 'convention_user'
      end
    end
  end

  get 'rooms/user/:id', to: 'messages#index', as: 'convention_user'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
