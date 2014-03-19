class CentersController < ApplicationController
  def show
    @center = Center.find(params[:id])
  end
end
