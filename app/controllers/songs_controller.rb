class SongsController < ApplicationController

  before_action :authenticate_user!

  def songnotes_index
    @song = Song.find(params[:id])
    @songnotes = @song.songnotes
    render template: 'songnotes/index'
  end
  
  def songnote
    @song = Song.find(params[:id]) 
    # Because ids are unique by table, we can go directly to using
    # Songnote.find (no need for @song.songnotes.find).
    @songnote = Songnote.find(params[:songnote_id])
    render template: 'songnotes/show'
  end

  def index
    # @songs = Song.all

    #PROVIDES SONGS WITH THEIR SONGNOTES BY CONFIRMING THEN SEARCHING FOR THE SONGNOTE ID
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
    @song = Song.find_by(id: params[:id])
    if @song.nil?
      render :new
    end
  end
  
  def new
    @song = Song.new
    @song.songnotes.build
  end
  
  def create
    # rehearsal = Rehearsal.find_or_create_by(rehearsal_id: song_params[:title])
    @song = rehearsal.song.build(song_params)
    @song = Song.new(rehearsal_id: params[:rehearsal_id], songnote_id: params[:songnote_id])
    @song.save
    
    if @song.save
      flash[:notice] = "Song Added"
      redirect_to songs_path
    else
      flash[:notice] = "Song NOT Added"
      render :new
      
    end
  end
  
  def edit
    @song = Song.find(params[:id])
    @song.songnotes.build
    # binding.pry

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
    flash[:notice] = "Song Deleted"
    redirect_to songs_path
  end

  def song_params
    params.require(:song).permit(:title, :genre, :key, :in_style_of, :user_id, :rehearsal_id, :songnotes_id, songnotes_attributes:[:content, :title, :category])
  end  
end
