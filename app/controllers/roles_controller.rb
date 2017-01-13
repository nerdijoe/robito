class RolesController < ApplicationController

  def new
  end

  def create
    current_user.update_attributes( role: params[:role][:role])
    byebug
    Brand.create(user_id: current_user.id)
    byebug

    redirect_to root_path
  end
end
