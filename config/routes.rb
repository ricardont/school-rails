Rails.application.routes.draw do
  resources :students
  resources :teachers
  resources :schedules
  resources :appointments
  get '/daily_schedule', to: "events#day" 
  root to: 'home#main' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
