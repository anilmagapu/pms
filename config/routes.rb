Rails.application.routes.draw do
  resources :projects
  get '/projects/:id/tasks/new' => 'projects#new_task', as: :new_task
  post '/projects/:id/tasks' => 'projects#create_task', as: :create_project_task
  get '/projects/:id/tasks/:tid/edit' => 'projects#edit_task', as: :edit_project_task
  patch '/projects/:id/tasks/:tid' => 'projects#update_task', as: :update_project_task
  delete '/projects/:id/tasks/:tid' => 'projects#destroy_task', as: :delete_project_task
  post '/projects/:id/tasks/:tid/comments' => 'projects#create_comment', as: :create_task_comment
  delete '/delete_comment' => 'projects#destroy_comment', as: :delete_comment

  root to: 'projects#index'
  post '/change_task_status'=>'projects#change_task_status'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
