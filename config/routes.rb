Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"

  # Defines a route for the path "/about"
  # get "/route", to: "controller#action" as:HelperName

  get('/welcome', { to: 'welcome#index', as: 'welcome' })
  get('/goodbye', { to: 'welcome#goodbye', as: 'goodbye' })
  # get('/goodbye', { to: 'welcome#goodbye', as: :tata })
  get('/form_example', { to: 'welcome#form_example', as: 'form_example' })
  # get('/example/:id') # /example/1

  # Routes for questions
#  get "/questions/new", to: "questions#new", as: :new_question
#  post "/questions" => "questions#create", as: :questions
#  get "/questions/:id" => "questions#show", as: :question
#  get "/questions" => "questions#index"
#  get "/questions/:id/edit" => "questions#edit", as: :edit_question
#  patch "/questions/:id" => "questions#update", as: :update_question
#  delete "/questions/:id" => "questions#destroy", as: :delete_question

resources :questions do
  resources :answers, only: [:create, :destroy]
end

resource :sessions

resources :users, only: [:new, :create]

end
