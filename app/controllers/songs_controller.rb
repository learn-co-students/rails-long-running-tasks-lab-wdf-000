class SongsController < ApplicationController
require 'csv'

def upload
  CSV.foreach(params[:file].path, headers: true) do |lead|
    Song.create(title: lead[0], artist_name: lead[1], release_year: lead[2], combined: lead[3], first: lead[4], year: lead[5], play_count: lead[6], f_g: lead[7])
  end
  redirect_to songs_path
end

  def index
    @songs = Song.all
  end


  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
