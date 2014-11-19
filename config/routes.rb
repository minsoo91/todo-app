Rails.application.routes.draw do
  root "site#root"	
  namespace :api do
    resources :todos, defaults: { format: :json }, only: [:create, :index, :show] do
      resources :comments, defaults: { format: :json }, only: [:index]
    end

    resources :comments, only: [:create, :show]
  end
end
