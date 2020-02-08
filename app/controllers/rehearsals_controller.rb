class RehearsalsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @rehearsals = Rehearsal.all
    # if params[:songnote_id]
    #   @songnote = Rehearsal.find_by(params[:songnote_id])
    #   if @songnote.nil?
    #     redirect_to rehearsals_songnotes_path
    #   else
    #     @rehearsals = @songnotes.rehearsals
    #   end
    # else
    #   @rehearsals = Rehearsal.all
    # end
  end

  def show
    @rehearsal = Rehearsal.find(params[:id])
  end

  def new
    @rehearsal = Rehearsal.new
  end

  def create
    # @rehearsal = Rehearsal.new(rehearsal_params) no foreign key is assigned.
    @rehearsal = current_user.rehearsals.build(rehearsal_params) # the foreign key is now assigned
      if  @rehearsal.save
        redirect_to :index
        flash[:notice] = "Rehearsal Created"

      else
        render :new
        flash[:notice] = "Rehearsal Not Created"
      end
  end

  def edit
    @rehearsal = Rehearsal.find(params[:id])
  end

  def update
    @rehearsal = Rehearsal.find(params[:id])
    Rehearsal.update(rehearsal_params)
    if @rehearsal.save
      redirect_to @rehearsal
    else
      render :edit
    end
  end

  def delete
    @rehearsal = Rehearsal.find(params[:id])
    @rehearsal.destroy
    flash[:notice] = "Rehearsal Deleted"
    redirect_to rehearsals_path
  end

  def rehearsal_params
    params.require(:rehearsal).permit(:location, :city, :purpose, :date, :time, song_ids:[])
  end
end
