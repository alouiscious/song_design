class SongnotesController < ApplicationController
  
  before_action :authenticate_user!
  
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
    @songnote = Songnote.new(songnote_params)
    
    @songnote.save
    
    #This is an in-memory attributes. it allow song_title (rather than song-id) to be set a songnote when the note is created.
    # @songnote = Songnote.new({
    #   song_title: params[:songnote][:song_title], content: params[:songnote][:content]
    #   })

  end

  def edit
    @songnote = Songnote.find([:id])

  end

  def update
    @songnote = Songnote.update(songnote_params)

  end

  def delete

  end

  def songnote_params
    params.require(:songnote).permit(:song_title, :title, :content, :type, :song_id)
    # params.require(:rehearsal).permit(:location, :date, :time, :purpose, song_ids:[], song_attributes: [:title])

  end  
end
