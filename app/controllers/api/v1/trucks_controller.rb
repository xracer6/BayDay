class Api::V1::TrucksController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: Truck.all
  end

  def create
    truck = Truck.new(truck_params)
    if truck.save 
      render json: Truck.all
    else
      render json: {errors: truck.errors.full_messages}
    end
  end

  private

  def truck_params
    params.require(:truck).permit(:company, :unit_number, :make, :model, :vin)
  end

end