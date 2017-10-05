Rails.application.routes.draw do
  root "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/login", to: redirect("/auth/google_oauth2")
  get "/auth/google_oauth2/callback", to: "sessions#create"
  resource :session, only: [:create, :destroy]
  get "/logout", to: "sessions#destroy"
  get '/auth/failure', to: redirect('/')
  get "/users/subscribe/:channel_id", to: "users#subscribe", as: "subscribe"
end
