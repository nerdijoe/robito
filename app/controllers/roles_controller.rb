class RolesController < ApplicationController

  def new
  end

  def create
    byebug
    current_user.update_attribute( :role, params[:role][:role])
    redirect_to root_path
  end
end
