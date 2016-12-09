Rails.application.routes.draw do
  resources :skills
  resources :workers
  resources :vacancies
  resources :worker_skills
  resources :vacancy_skills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'main', to: 'main#index', as: :main
  get '/workers/:id/vacancies', to: 'workers#vacancies'
  root :to => 'main#index'
end
