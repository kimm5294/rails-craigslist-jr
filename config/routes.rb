Rails.application.routes.draw do
  get 'categories/index'

  resources :categories do
    resources :articles
  end

  root 'welcome#index'

end
