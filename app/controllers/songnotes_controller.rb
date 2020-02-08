class SongnotesController < ApplicationController
  
  # before_action :authenticate_user!
  
  def index
      @songnotes = Songnote.all
  end

  def show
    @songnote = Songnote.find(params[:id])
  end

  def new
    @songnote = Songnote.new

  end

  def create
    # @songnote = Songnote.new(songnote_params)
    
    #This is an in-memory attributes. it allow song_title (rather than song-id) to be set as songnote when the note is created.
    @songnote = Songnote.new({
      song_title: params[:songnote][:song_title], title: params[:songnote][:title], content: params[:songnote][:content], category: params[:songnote][:category]
      })
      @songnote.save
  end

  def edit
    @songnote = Songnote.find(params[:id])
  end

  def update
    @songnote = Songnote.find(params[:id])
    Songnote.update(songnote_params)
    if @songnote.save
      redirect_to songs_path(@song)
    else
      flash[:alert] = "Note Not Saved"
    end
  end

  def destroy
    @songnote = Songnote.find(params[:id])
    @songnote.destroy
    flash[:notice] = "Song Deleted"
    redirect_to @song.songnotes
  end

  def songnote_params
    params.require(:songnote).permit(:song_title, :title, :content, :category, :song_id)

  end  
end
