class SongsController < ApplicationController

  before_action :require_admin #, except: [:index, :show]
  before_action :set_song, only: [:destroy]

  def index
  	@songs = Song.all 
  	@song = Song.new
  end

  def create
  	@song = Song.new(song_params)
    if @song.save
      redirect_to root_path, notice: "Thanks, song has been uploaded"
    else
      flash.now[:alert] = "Sorry we couldn't upload the song at this time"
      @songs = Song.all
      render :index
    end
  end

  def destroy
  	@song.destroy
    redirect_to root_path, notice: 'Song was successfully deleted.'
  end

 private

 # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:artist, :title, :audio)
    end
 
end
