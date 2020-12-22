Rails.application.routes.draw do
  get 'welcome/index'
  get 'administrators/index'
  get 'administrators/search'

  get 'administrators/results'
  get 'patrons/index'
  get 'patrons/search'
  get 'patrons/results'

  resources :books do 
    resources :reviews 
    get :checkout
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
