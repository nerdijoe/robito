class RolesController < ApplicationController

  def new
  end

  def create
    current_user.update_attributes( role: params[:role][:role])

    if current_user.Brand?
      Brand.create(user_id: current_user.id)
      redirect_to root_path, notice: "Successfully created a BRAND account."
    else
      Influencer.create(user_id: current_user.id)
      redirect_to root_path, notice: "Successfully created an INFLUENCER account."
    end

  end
end
