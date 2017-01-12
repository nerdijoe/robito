class RolesController < ApplicationController

  def new
  end

  def create
    current_user.update_attributes( role: params[:role][:role], type: params[:role][:role])
    byebug
    redirect_to root_path
  end
end
