Rails.application.routes.draw do
  get 'items/index'

  #CREATE

  get "/items/new",       {:controller => "items", :action => "new", :as => "new_item"}
  post "/items",          {:controller => "items", :action => "create", :as => "items"}
  
  #READ
  
  get "/items/:id",       {:controller => "items", :action => "show", :as => "item"}
  get "/items",           {:controller => "items", :action => "index"}
  
  #UPDATE
  
  get "/items/:id/edit",  {:controller => "items", :action => "edit", :as => "edit_item"}
  patch "/items/:id",     {:controller => "items", :action => "update"}
  
  #DESTROY
  
  delete "/items/:id",    {:controller => "items", :action => "destroy"}  
  
end
