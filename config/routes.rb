Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments do
      collection do
        get :refresh
      end
    end
  end

  root 'articles#index'
end
