class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(song_params)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.save

  end

  def edit
    @song = Song.find([:id])

  end

  def update
    @song = Song.update(song_params)

  end

  def delete

  end

  def song_params
    require.params(:song).permit(:title, :genre, :key, :in_style_of)
  end  
end
