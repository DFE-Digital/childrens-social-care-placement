Rails.application.routes.draw do
  root to: "pages#show", page: "home"

  devise_for :users

  resources :foster_parents, only: :show

  namespace :diary do
    resources :steps,
              only: %i[index show update] do
      collection do
        get :completed
      end
    end
  end

  get "/pages/:page", to: "pages#show"

  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all
end
