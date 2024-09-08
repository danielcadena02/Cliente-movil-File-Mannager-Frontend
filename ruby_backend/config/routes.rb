Rails.application.routes.draw do
  post '/login', to: 'logins#login'
  get '/folders', to: 'folders#list_folder'
  get '/folders/get_folders_by_parent_id', to: 'folders#get_folders_by_parent_id'
  get '/folders/update_folder_soap', to: 'folders#update_folder_soap'
  get '/folders/share_folder_soap', to: 'folders#share_folder_soap'
  get '/folders/delete_folder_soap', to: 'folders#delete_folder_soap'
end
