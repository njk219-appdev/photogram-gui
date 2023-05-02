Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "index"})
  get("/users", {:controller => "users", :action => "index"})
  get("/photos", {:controller => "photos", :action => "index"})
  get("/insert_photo", {:controller => "photos", :action => "create"})
  ###### Dynamic Below
  get("/users/:path_username", {:controller => "users", :action => "show"})
  get("/photos/:path_id", {:controller => "photos", :action => "show"})
  get("/delete_photo/:toast_id", {:controller => "photos", :action => "delete"})
  
  #get("/insert_photo/:input_id", {:controller => "photos", :action => "delete"})

end
