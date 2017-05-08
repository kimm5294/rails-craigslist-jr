Rails.application.routes.draw do
  get 'welcome/index'

  resources :categories

  root 'welcome#index'

end
