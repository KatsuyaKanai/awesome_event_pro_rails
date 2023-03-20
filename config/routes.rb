Rails.application.routes.draw do
  root "welcome#index"
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  get 'status' => 'status#index', defaults: { format: 'json' }

  resources :retirements

  resources :events do
    resources :tickets
  end

  match "*path" => "application#error404", via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
