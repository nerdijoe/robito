class BrandsController < ApplicationController
  layout "application"

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
    if  @brand.update(edit_brand_params)
      redirect_to brand_path(current_user.brand), notice: "Successfully updated your BRAND"
    else
      redirect_to root_path
      flash[:notice] = "Error"
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    if @brand.destroy
      current_user.zero!
      redirect_to root_path, notice: "Successfully account DELETED"
    else
      redirect_to brand_path(current_user.brand), notice: "Unuccessfully account Deleted"
    end
  end

  private

  def edit_brand_params
    params.require(:brand).permit(:brand_name, :description, :company_name, :email, :phone_number, :address, :link, {image: []})
  end


end
