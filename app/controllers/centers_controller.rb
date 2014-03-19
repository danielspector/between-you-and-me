class CentersController < ApplicationController
  def show
    @center = Center.find(params[:id])
    @loc1 = @center.locations.first
    @loc2 = @center.locations.second
  end
end
