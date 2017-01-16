class BrandsController < ApplicationController


  def index
    @user = current_user
    @campaigns = current_user.brand.campaigns.order(created_at: :desc)
  end
  
  def show
    @brand = Brand.find(params[:id])
  end

  def create
    # byebug
    Brand.create()
    # byebug
  end

  def edit
  @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    @brand.update(edit_brand_params)
    redirect_to brand_path(current_user.brand)
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    current_user.zero!
    redirect_to root_path
  end

  private

  def edit_brand_params
    params.require(:brand).permit(:brand_name, :description, :company_name, :email, :phone_number, :address, :link, {image: []})
  end

 
end
