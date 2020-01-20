class RehearsalsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @rehearsals = Rehearsal.all
  end

  def show
    @rehearsal = Rehearsal.find(params[:id])
  end

  def new
    @rehearsal = Rehearsal.new
  end

  def create
    @rehearsal = Rehearsal.new(rehearsal_params)
    @rehearsal.save
  end

  def edit
    @rehearsal = Rehearsal.find(params[:id])
  end

  def update
    @rehearsal = Rehearsal.update(rehearsal_params)
  end

  def delete

  end

  def rehearsal_params
    require.params(:rehearsal).permit(:location, :city, :purpose, :date, :time)
  end
end
