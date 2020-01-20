class MusiciansController < ApplicationController
  
  before_action :authenticate_user!
  def index
    @musicians = Musician.all
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.new(musician_params)
    @musician.save
  end

  def edit
    @musician = Musician.find(params[:id])
  end

  def update
    @musician = Musician.update(musician_params)
  end

  def delete

  end

  def musician_params
    require.params(:musician).permit(:name, :city, :email, :phone, :instrument)
  end
end
