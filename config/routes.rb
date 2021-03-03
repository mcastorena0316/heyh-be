Rails.application.routes.draw do
  root 'static_page#home'
  namespace :v1 do
    resource :users, only: [:create] do
      get :retrieve_token
    end
    resources :properties
  end
end
