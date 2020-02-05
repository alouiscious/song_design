class SongsController < ApplicationController

  before_action :authenticate_user!

  def songnotes_index
    @song = Song.find(params[:id])
    @songnotes = @song.songnotes
    render template: 'songnotes/index'
  end
  
  def songnote
    @song = Song.find(params[:id]) 
    # Because ids are unique by table, we can go directly to
    # Songnote.find (no need for @song.songnotes.find).
    @songnote = Songnote.find(params[:songnote_id])
    render template: 'songnotes/show'
  end

  def index
    if params[:songnote_id]
      @songnote = Song.find_by(params[:songnote_id])
      if @songnote.nil?
        redirect_to songs_songnotes_path
      else
        @song = @songnotes.songs
      end
    else
      @songs = Song.all
    end
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
    @song = Song.update(song_params)
    @song.save
    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def delete
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song Deleted"
  end

  def song_params
    params.require(:song).permit(:title, :genre, :key, :in_style_of, :user_id, :rehearsal_id)
  end  
end
