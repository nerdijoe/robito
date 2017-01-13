class RolesController < ApplicationController

  def new
  end

  def create
    current_user.update_attributes( role: params[:role][:role])
    byebug
    current_user.brand.create()
    byebug

    redirect_to root_path
  end
end
