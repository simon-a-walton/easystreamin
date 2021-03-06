class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.where(user_id: current_user)
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    if @playlist.save
      redirect_to playlists_path
    else
      flash[:alert] = "Sorry the details for your playlist don't work, please try again"
      redirect_to playlists_path
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to playlists_path
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :url)
  end
end
