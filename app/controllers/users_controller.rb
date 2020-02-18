class UsersController < ApplicationController
  
  before_action :authenticate_user!

  
  # def user_rehearsal_index
  #   @user = User.find(params[:id])
  #   @user_rehearsal = @user.user_rehearsal
  #   render template: 'user_rehearsal/index'
  # end
  
  # def user_rehearsal
  #   @user = User.find(params[:id]) 
  #   # Because ids are unique by table, we can go directly to using
  #   # Rehearsal.find (no need for @rehearsal.user_rehearsal.find).
  #   @user_rehearsal = User_Rehearsal.find(params[:user_rehearsal_id])
  #   render template: 'user_rehearsal/show'
  # end
  
  def index
    if params[:songnote_id]
      @songnote = User.find_by(params[:songnote_id])
      if @songnote.nil
        redirect_to users_path
      else
        @user = @songnotes.users
      end
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end

  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User Deleted"
  end

  def user_params
    params.require(:user).permit(:name, :city, :email, :phone, :instrument,)
  end
end
