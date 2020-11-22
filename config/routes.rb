Rails.application.routes.draw do
  devise_for :users
  resources :contacts do
  	get 'load_viewable_count', on: :member
  end
  authenticated :user do
    root to: 'contacts#index', as: :authenticated_root
  end
  get 'sort', controller: 'contacts', action: 'sort', as: :sort
  root to: redirect('/users/sign_in')
  # root to: redirect('/users/sign_in')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
