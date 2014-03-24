# require 'actionpack/action_caching'
class PointsController < ApplicationController
  caches_action :new

  def new
    @categories = Category.all
  end

  def create
    @add1 = Point.find_or_create_by(address: params[:point][:address1])
    @add2 = Point.find_or_create_by(address: params[:point][:address2])
    @center = Point.find_between(@add1, @add2)
    session[:search_term] = params[:search][:term]

    redirect_to @center
  end


end
