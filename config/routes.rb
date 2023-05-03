Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "index"})
  get("/users", {:controller => "users", :action => "index"})
  get("/photos", {:controller => "photos", :action => "index"})
  get("/insert_photo", {:controller => "photos", :action => "create"})
  get("/insert_comment_record", {:controller => "photos", :action => "comment"})
  get("/insert_user_record", {:controller => "users", :action => "create"})
  ###### Dynamic Below
  get("/users/:path_username", {:controller => "users", :action => "show"})
  get("/photos/:path_id", {:controller => "photos", :action => "show"})
  get("/delete_photo/:toast_id", {:controller => "photos", :action => "delete"})
  get("/update_photo/:modify_id", {:controller => "photos", :action => "update"})
  get("/update_user/:user_id", {:controller => "users", :action => "update"})
end
