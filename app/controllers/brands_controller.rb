class BrandsController < ApplicationController

  def create
    byebug
    Brand.create()
    byebug
  end

  def show
    @user = Brand.find(params[:id])
  end
end
