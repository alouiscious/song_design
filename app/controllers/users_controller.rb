class UsersController < ApplicationController
  
  before_action :authenticate_user!
  def index
    @users = User.all
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
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.update(params[:id])
    if User.update(user_params)
      redirect_to(@user)
    else
      render :edit
    end

  end

  def delete

  end

  def user_params
    require.params(:user).permit(:name, :city, :email, :phone, :instrument,)
  end
end
