class SongsController < ApplicationController

  before_action :authenticate_user!
  
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
    params.require(:song).permit(:title, :genre, :key, :in_style_of, :user_id, :rehearsal_id,
      songnotes_attributes:[
        :title,
        :content,
        :type
      ]
    )
  end  
end
