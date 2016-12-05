Rails.application.routes.draw do
  resources :skills
  resources :workers
  resources :vacancies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'vacancies#index'
end
