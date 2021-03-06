Rails.application.routes.draw do
  root to: "pages#show", page: "home"

  devise_for :users

  namespace :children_creation do
    resources :steps, only: %i[show update]
  end

  get "/dashboards/foster_parent", to: "dashboards#foster_parent"
  get "/dashboards/matchmaker", to: "dashboards#matchmaker"
  get "/postcode_api_error", to: "pages#postcode_api_error"

  resources :shortlists, only: %i[edit update]
  resources :shortlisted_foster_parents, only: :create
  resources :children do
    resources :placement_needs, only: %i[new create]
  end

  resources :placements, only: :create do
    resources :diary_entries,
              only: %i[index show] do
    end
    namespace :diary do
      resources :steps,
                only: %i[index show update] do
        collection do
          get :completed
        end
      end
    end
  end

  get "/pages/:page", to: "pages#show"

  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all
end
