class LocationsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @add1 = Location.create(address: params[:location][:address1])
    @add2 = Location.create(address: params[:location][:address2])
    @center = Location.find_between(@add1, @add2)

    respond_to do |format|
      format.js {
        render :json => {
          :center => @center ,
          :address1 => @add1,
          :address2 => @add2
        }
      }
    end
  end

  def show

  end
end
