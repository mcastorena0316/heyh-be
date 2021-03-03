Rails.application.routes.draw do
  namespace :v1 do
    resource :users, only: [:create] do
      get :retrieve_token
    end
    resources :properties
  end
end
