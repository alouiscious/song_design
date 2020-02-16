class UsersController < ApplicationController
  
  before_action :authenticate_user!

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
