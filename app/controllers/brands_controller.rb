class BrandsController < ApplicationController


  def index
    @user = current_user
    @campaigns = current_user.brand.campaigns.order(created_at: :desc)
  end

  def create
    byebug
    Brand.create()
    byebug
  end

  def show
    @brand = Brand.find(params[:id])
  end
end
