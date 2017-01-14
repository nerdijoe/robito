class BrandsController < ApplicationController


  def index
    @user = current_user
    @campaigns = current_user.brand.campaigns
  end

  def create
    byebug
    Brand.create()
    byebug
  end

  def show
    @user = Brand.find(params[:id])
  end
end
