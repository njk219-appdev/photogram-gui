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
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id
    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
    #render({ :template => "photo_templates/create.html.erb"})
  end

  def update
    #Parameters: {"input_image"=>"https://robohash.org/suntprovidentassumenda.png?size=300x300&set=set1", "input_caption"=>"All dwarfs are bastards in ther's eyes", "modify_id"=>"695"}

    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption
    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
    #render({ :template => "photo_templates/update.html.erb"})
  end

  def comment
    #Parameters: {"input_photo_id"=>"777", "input_author_id"=>"111", "input_body"=>"hi"}
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_body = params.fetch("input_body")

    a_new_comment = Comment.new
    a_new_comment.photo_id = input_photo_id
    a_new_comment.author_id = input_author_id
    a_new_comment.body = input_body
    a_new_comment.save

    #render({ :template => "photo_templates/comment.html.erb"})
    redirect_to("/photos/" + a_new_comment.photo_id.to_s)
  end
 
end
