OpenDoList::Application.routes.draw do

  root :to => "home#index"
  #root :to => "tasks#index"
  
  devise_for :users
  
  resources :user, :only => :show
  resources :tags
  resources :tasks
  
  # complete task
  match 'complete/:id' => 'tasks#complete'

  # list of completed tasks
  match 'completed' => 'tasks#completed'  
  
end
