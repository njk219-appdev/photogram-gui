Rails.application.routes.draw do

  get("/users", {:controller => "users", :action => "index"})
  ###### Dynamic Below
  get("/users/:path_username", {:controller => "users", :action => "show"})

end
