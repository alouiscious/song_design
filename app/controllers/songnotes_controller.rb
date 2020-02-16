class SongnotesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
      @songnotes = Songnote.all
      # binding.pry

  end

  def show
    @songnote = Songnote.find_by(rehearsal_id: params[:rehearsal_id], song_id: params[:song_id])
    @organized_rehearsal.songnotes.build
  end

  def new
    if params[:rehearsal_id] && !Rehearsal.exists?(params[:rehearsal_id])
      redirect_to rehearsals_path, alert: "Rehearsal NOT found."
    else
      @songnote = Songnote.new
      # @songnote = Songnote.new(rehearsal_id: params[:rehearsal_id])
      # @songnote = Songnote.new(rehearsal_id: params[:rehearsal_id], song_id: params[:song_id], organizer_id: params[:organizer_id])
      # @songnote.songs.build
      # @song.songnotes.build
      # @user.songnotes.build
    end

  end
  
  def create
    @songnote = Songnote.new(songnote_params)
    # @songnote = Songnote.new({title: params[:songnote][:title], content: params[:songnote][:content], category: params[:songnote][:category], rehearsal_id: params[:songnote][:rehearsal_id], song_id: params[:songnote][:song_id]})
    @songnote.save
    if @songnote.save
      flash[:alert] = "Note Created."
      redirect_to songnotes_path
    else
      flash[:notice] = "Songnote NOT created!"
      render :new 
    end
    # binding.pry
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
    redirect_to songs_path
  end

  private

  def songnote_params
    params.require(:songnote).permit(:title, :content, :category, :rehearsal_id, :song_id, :user_id)

  end  
end