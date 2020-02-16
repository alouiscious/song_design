class RehearsalsController < ApplicationController

  before_action :authenticate_user!

  # def user_rehearsal_index
  #   @rehearsal = Rehearsal.find(params[:id])
  #   @user_rehearsal = @rehearsal.user_rehearsal
  #   render template: 'user_rehearsal/index'
  # end
  
  # def user_rehearsal
  #   @rehearsal = Rehearsal.find(params[:id]) 
  #   # Because ids are unique by table, we can go directly to using
  #   # Rehearsal.find (no need for @rehearsal.user_rehearsal.find).
  #   @user_rehearsal = User_Rehearsal.find(params[:user_rehearsal_id])
  #   render template: 'user_rehearsal/show'
  # end

  def index
    # @rehearsals = Rehearsal.all
    if params[:organizer_id]
      @organizer = Rehearsal.find_by(params[:organizer_id])
      if @organizer.nil?
        redirect_to rehearsals_organizers_path
      else
        @rehearsals = @organizers.rehearsals
      end
    else
      @rehearsals = Rehearsal.all
    end
    # binding.pry
  end
  
  def show
    @rehearsal = Rehearsal.find(params[:id])
    @rehearsal.songnotes.build
    @rehearsal.users.build

    # binding.pry
    if @rehearsal.nil?
      render :new
    end
    
  end
  
  def new
    @rehearsal = Rehearsal.new
    @rehearsal.songnotes.build
    @rehearsal.users.build
  end
  
  def create
    @rehearsal = Rehearsal.new(rehearsal_params) #no foreign key is assigned.
    @rehearsal = current_user.organized_rehearsals.build(rehearsal_params) # the foreign key is now assigned
    @rehearsal.save
    # binding.pry

    if @rehearsal.save
      redirect_to rehearsals_path
      flash[:notice] = "Rehearsal Created"
    else
      render :new
      flash[:notice] = "Rehearsal Not Created"
    end
  end
  
  def edit
    @rehearsal = Rehearsal.find(params[:id])
    @rehearsal.songs.build

  end

  def update
    @rehearsal = Rehearsal.find(params[:id])
    if @rehearsal.update(rehearsal_params)
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
    params.require(:rehearsal).permit(:location, :city, :purpose, :date, :time, :organizer_id, songnotes_attributes: [:song_title, :title, :content, :category, :user_id, :rehearsal_id, :song_id])
  end
end
