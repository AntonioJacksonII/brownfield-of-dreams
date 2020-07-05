class Admin::PlaylistsController < ApplicationController

  def new
  
  end

  def create
    tutorial = Tutorial.create(tutorial_params)

    json = YoutubeService.new.playlist_info(params[:playlist_id])
    @videos = json[:items]
    @videos.each do |video|
      attributes = { 'title' => video[:snippet][:title],
                      'description' => video[:snippet][:description],
                      'thumbnail' => video[:snippet][:thumbnails],
                      'video_id' => video[:id]
      }
      tutorial.videos.create(attributes)
    end
    if tutorial.save 
      redirect_to admin_dashboard_path
      flash[:notice] = "Successfully created tutorial."
        # redirect_to admin_dashboard_path, notice: "Successfully created tutorial. #{view_context.link_to('View it here.', tutorial_path(tutorial.id))}".html_safe
      # strip_links('<a href="tutorial_path(tutorial.id)">View it here.</a>')
      # {view_context.link_to 'View it here.', tutorial_path(tutorial.id)}".html_safe
    end
  end 

  private

  def tutorial_params
    params.permit(:title, :description, :playlist_id)
  end
end