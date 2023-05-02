class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})
    render({ :template => "photo_templates/index.html.erb"})
  end

  def show
    # Parameters: {"path_username"=>"ali"}
    url_photo = params.fetch("path_id")
    matching_photo = Photo.where({:id => url_photo})

    @the_photo = matching_photo.first #this can be .at(0)
    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/show.html.erb"})
    end
  end

  def delete
    url_photo = params.fetch("toast_id")
    matching_photo = Photo.where({:id => url_photo})

    the_photo = matching_photo.first #this can be .at(0)
    the_photo.destroy

    #render({ :template => "photo_templates/delete.html.erb"})
    redirect_to("/photos")
  end

  def create
    #Parameters: {"input_image"=>"1", "input_caption"=>"2", "input_owner_id"=>"3"}

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_image
    a_new_photo.owner_id = input_owner_id
    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
    #render({ :template => "photo_templates/create.html.erb"})
  end
 
end
