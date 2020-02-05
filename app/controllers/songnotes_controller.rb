class SongnotesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    if params[:song_id]
      @songnotes = Song.find(paramas[:song_id]).songnotes
    else
      @songnotes = Songnote.all
    end
  end

  def show
    songnote = Songnote.find(params[:id])
  end

  def new
    songnote = Songnote.new
  end

  def create
    songnote = Songnote.new(songnote_params)
    songnote.save

  end

  def edit
    songnote = Songnote.find([:id])

  end

  def update
    songnote = Songnote.update(songnote_params)

  end

  def delete

  end

  def songnote_params
    params.require(:songnote).permit(:title, :content, :type)
    # params.require(:rehearsal).permit(:location, :date, :time, :purpose, song_ids:[], song_attributes: [:title])

  end  
end
