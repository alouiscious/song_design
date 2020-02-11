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
    if params[:user_rehearsal_id]
      @user_rehearsal = Rehearsal.find_by(params[:user_rehearsal_id])
      if @user_rehearsal.nil?
        redirect_to rehearsals_user_rehearsals_path
      else
        @rehearsals = @user_rehearsals.rehearsals
      end
    else
      @rehearsals = Rehearsal.all
    end
  end

  def show
    @song = Song.find(params[:id])
    @rehearsal = Rehearsal.find(params[:id])
    # binding.pry
    @rehearsal.songnotes.build

    if @rehearsal.nil?
      render :new
    end
  end

  def new
    @rehearsal = Rehearsal.new(songnote_id: params[:songnote_id], song_id: params[:song_id])
    @rehearsal.songs.build
    @rehearsal.users.build
    # @rehearsal.organizer.build
  end

  def create
    # @rehearsal =  # the foreign key is now assigned
    # @rehearsal = Rehearsal.new(rehearsal_params) #no foreign key is assigned.

    @rehearsal = current_user.rehearsals.build(rehearsal_params) # the foreign key is now assigned
    @rehearsal.save
    if  @rehearsal.save
      redirect_to @rehearsal
      flash[:notice] = "Rehearsal Created"
    else
      render :new
      flash[:notice] = "Rehearsal Not Created"
    end
  end
  
  def edit
    @rehearsal = Rehearsal.find(params[:id])
    @rehearsal.songs.build
    binding.pry
    # @rehearsals.organizers.build


  end

  def update
    @song = Song.find_or_create_by(params[:id])
    @rehearsal = Rehearsal.find(params[:id])
    @rehearsal = Rehearsal.update(rehearsal_params)

    if @rehearsal.update(rehearsal_params).to_hash
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
    params.require(:rehearsal).permit(:location, :city, :purpose, :date, :time, :organizer, :organizer_name, :song_title, :song_id, :user_id, :user_name)
  end
end
