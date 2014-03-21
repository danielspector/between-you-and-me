class PointsController < ApplicationController

  def index
  end

  def new
    @categories = Category.all

  end

  def create
    @add1 = Point.create(address: params[:point][:address1])
    @add2 = Point.create(address: params[:point][:address2])
    @center = Point.find_between(@add1, @add2)
    session[:search_term] = params[:search][:term]
    redirect_to center_path(@center)


    # respond_to do |format|
    #   format.js {
    #     render :json => {
    #       :center => @center,
    #       :address1 => @add1,
    #       :address2 => @add2,
    #     }
    #   }
    #end
  end


end
