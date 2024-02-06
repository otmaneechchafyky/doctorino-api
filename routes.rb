Rails.application.routes.draw do
  # Authentications
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Current user path
  get '/current_user', to: 'current_user#show'

  # Animals, Vets, Appointments, Genres, Specializations ressources
  resources :animals
  resources :vets
  resources :appointments, only: [:index, :show, :create, :destroy]
  resources :genres, only: [:index]
  resources :specializations, only: [:index]
end
