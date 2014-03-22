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
    
    redirect_to @center
  end


end
