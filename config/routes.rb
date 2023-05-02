Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "index"})
  get("/users", {:controller => "users", :action => "index"})
  get("/photos", {:controller => "photos", :action => "index"})
  ###### Dynamic Below
  get("/users/:path_username", {:controller => "users", :action => "show"})
  get("/photos/:path_id", {:controller => "photos", :action => "show"})

end
