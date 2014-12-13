Rails.application.routes.draw do

  root "static_pages#index"

  namespace :api do
    get :collage, to: "collage#show", defaults: { format: :json }
  end
end
