class BrandsController < ApplicationController
  def show
    @user = Brand.find(params[:id])
  end
end
