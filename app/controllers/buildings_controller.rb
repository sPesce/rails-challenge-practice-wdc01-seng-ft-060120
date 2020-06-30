class BuildingsController < ApplicationController
  
  before_action :set_building, only: [:show,:update,:edit]
  
  def index
    @buildings = Building.all
  end
  
  def show
  end
  
  def edit
  end

  def update
  end

  private

  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:name,:country,:address,:rent_per_floor,:number_of_floors)
  end

end