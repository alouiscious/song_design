class SongnotesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
      @songnotes = Songnote.all
  end

  def show
    @songnote = Songnote.find_by(rehearsal_id: params[:rehearsal_id])
    # binding.pry
  end

  def new
    if params[:rehearsal_id] && !Rehearsal.exists?(params[:rehearsal_id])
      redirect_to rehearsals_path, alert: "Rehearsal NOT found."
    else
      @songnote = Songnote.new(rehearsal_id: params[:rehearsal_id])
      # binding.pry
    end
    # @rehearsal.songnote.build

  end
  
  def create
    #This is an in-memory attributes. it allow song_title (rather than song-id) to be set as songnote when the note is created.
    @songnote = Songnote.new({title: params[:songnote][:title], content: params[:songnote][:content], category: params[:songnote][:category], rehearsal_id: params[:songnote][:rehearsal_id], song_id: params[:songnote][:song_id]})
    # @songnote = Songnote.new(songnote_params)
    @songnote.save
    if @songnote.save
      redirect_to @rehearsal, alert: "Note Created."
    else
      render :new, alert: "Songnote NOT created!"
    end
  end
  
  def edit
    if params[:rehearsal_id]
      rehearsal = Rehearsal.find_by(id: params[:rehearsal_id])
      if rehearsal.nil?
        redirect_to rehearsals_path, alert: "Rehearsal not found."
      else
        @songnote = rehearsal.songnotes.find_by(id: params[:id])
        redirect_to rehearsal_songnotes_path(rehearsal), alert: "Songnote not found." if @songnote.nil?
      end
    else
      @songnote = Songnote.find_by(params[:id])
    end
  end

  def update
    @songnote = Songnote.find(params[:id])
    if @songnote.update(songnote_params)
      redirect_to songnote_path(@songnote)
    else
      flash[:alert] = "Note Not Updated"
    end
  end

  def destroy
    @songnote = Songnote.find(params[:id])
    @songnote.destroy
    flash[:notice] = "Song Deleted"
    redirect_to @song.songnotes
  end

  private

  def songnote_params
    params.require(:songnote).permit(:title, :content, :category, :rehearsal_id)

  end  
end