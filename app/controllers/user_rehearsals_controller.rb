class UserRehearsalsController < ApplicationController
  before_action :authenticate_user!
  
  def index
 
      @user_rehearsals = UserRehearsal.all
  end

  def show
    @user_rehearsals = UserRehearsal.find(user_rehearsal_params)
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
    @user_rehearsal = UserRehearsal.find_by(params[:id])

  end

  def update
    @user_rehearsal = UserRehearsal.find_by(params[:id])
    @user_rehearsal = UserRehearsal.update(user_rehearsal_params)
    if @user_rehearsal.save
      redirect_to @user_rehearsal
    else
      render :edit
    end
  end

  def delete
    @user_rehearsal = UserRehearsal.find_by(params[:id])
    @user_rehearsal.destroy
    flash[:notice] = "Rehearsal Deleted"
  end

  def user_rehearsal_params
    params.require(:user_rehearsal).permit(:user_id, :rehearsal_id, :created_at, :updated_at)
  end  
end
