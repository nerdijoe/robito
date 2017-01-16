class RolesController < ApplicationController

  def new
  end

  def create
    current_user.update_attributes( role: params[:role][:role])
    if current_user.Brand?
      Brand.create(user_id: current_user.id)
    else
      Influencer.create(user_id: current_user.id)
    end

    redirect_to root_path
  end
end
