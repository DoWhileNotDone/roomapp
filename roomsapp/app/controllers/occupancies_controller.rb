class OccupanciesController < ApplicationController

  def index
    @occupancies = Occupancy.all
  end

  def show
    @occupancy = Occupancy.find(params[:id])
  end

  def new
    @occupancy = Occupancy.new
  end

  def edit
    @occupancy = Occupancy.find(params[:id])
  end

  def create
    @occupancy = Occupancy.new(occupancy_params)

    if @occupancy.save
      redirect_to @occupancy
    else
      render 'new'
    end

  end

  def update
    @occupancy = Occupancy.find(params[:id])

    if @occupancy.update(occupancy_params)
      redirect_to @occupancy
    else
      render 'edit'
    end
  end

  def destroy
    @occupancy = Occupancy.find(params[:id])
    @occupancy.destroy

    redirect_to occupancies_path
  end

  private
  def occupancy_params
    params.require(:occupancy).permit(:start_date, :end_date, :person_id, :room_id)
  end
end
