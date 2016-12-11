class SongsController < ApplicationController
  require 'csv'
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

  def upload
    CSV.foreach(params[:file].path, headers: true) do |song|
      # binding.pry
      # "Song Clean":"Caught Up in You" "ARTIST CLEAN":".38 Special" 
      # "Release Year":"1982" "COMBINED":"Caught Up in You by .38 
      # Special" "First?":"1" "Year?":"1" "PlayCount":"82" "F*G":"82
      artist = Artist.find_or_create_by(name: song[1])
      artist.songs.create(title: song[0])
    end
    redirect_to songs_path
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

