Rails.application.routes.draw do

   # get "/", to: "pages#home", as: "root"
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :quotes 
  # resources :quotes do
  #     get "generate", on: :new
  # end

  get "/generators/new", to: "generators#new", as: "new_generator"
  
end
