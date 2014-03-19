class LocationsController < ApplicationController
  def index
  end

  def create
    @add1 = Location.create(address: params[:location][:address1])
    @add2 = Location.create(address: params[:location][:address2])
    @center_id = Location.find_between(@add1, @add2)
    redirect_to center_path(@center_id)
  end
end
