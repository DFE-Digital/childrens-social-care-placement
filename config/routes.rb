Rails.application.routes.draw do
  root to: "pages#show", page: "home"

  devise_for :users

  namespace :diary do
    resources :steps,
              only: %i[index show update] do
      collection do
        get :completed
      end
    end
  end
  namespace :children_creation do
    resources :steps, only: %i[show update]
  end

  get "/dashboards/foster_parent", to: "dashboards#foster_parent"
  get "/dashboards/matchmaker", to: "dashboards#matchmaker"

  resources :shortlists, only: :show
  resources :placements, only: :create
  resources :children, only: %i[new create]

  get "/pages/:page", to: "pages#show"

  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all
end
