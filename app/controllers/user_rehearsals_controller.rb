class UserRehearsalsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:rehearsal_id]
      @rehearsal = Rehearsal.find_by(id: params[:rehearsal_id])
      if @rehearsal.nil?
        redirect_to rehearsal_path, alert: "Rehearsal not found"
      else
        @user_rehearsals = @rehearsal.user_rehearsals
      end
    else
      @user_rehearsals = UserRehearsal.all
    end
  end

  def show
    if params[:rehearsal_id]
      @rehearsal = Rehearsal.find_by(id: params[:rehearsal_id])
      @user_rehearsal = @rehearsal.user_rehearsals.find_by(id: params[:id])
      if @user_rehearsal.nil?
        redirect_to rehearsal_user_rehearsals_path(@rehearsal), alert: "User's rehearsal not found"
      end
    else    
      @user_rehearsal = UserRehearsal.find(params[:id])
    end
  end

  def new
    @user_rehearsal = UserRehearsal.new
  end

  def create
    @user_rehearsal = UserRehearsal.new(user_rehearsal_params)
    if @user_rehearsal.save
      redirect_to @user_rehearsal
    else
      render :new
    end
  end

  def edit
    @user_rehearsal = UserRehearsal.find(params[:id])

  end

  def update
    @user_rehearsal = UserRehearsal.find(params[:id])
    @user_rehearsal = UserRehearsal.update(user_rehearsal_params)
    if @user_rehearsal.save
      redirect_to @user_rehearsal
    else
      render :edit
    end
  end

  def delete
    @user_rehearsal = UserRehearsal.find(params[:id])
    @user_rehearsal.destroy
    flash[:notice] = "Rehearsal Deleted"
  end

  def user_rehearsal_params
    params.require(:user_rehearsal).permit(:user_id, :rehearsal_id, :created_at, :updated_at, :rehearsal_location, :rehearsal_date, :rehearsal_time, :rehearsal_purpose, :rehearsal_organizer_id)
  end  
end
