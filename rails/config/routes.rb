Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :dashboards, only: [:index, :show, :create, :update] do
        resources :lists, only: [:create, :update] do
          resources :cards, only: [:index, :show, :create, :update] do
            member do
              put 'move'
            end
          end
        end
      end
      resources :users, only: [:index]
    end
  end
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
