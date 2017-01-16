class RolesController < ApplicationController

  def new
  end

  def create
    current_user.update_attributes( role: params[:role][:role])
    # byebug
    if current_user.Brand?
      Brand.create(user_id: current_user.id)
          redirect_to root_path, notice: "Successfully created BRAND account"

    else
      Influencer.create(user_id: current_user.id)
          redirect_to root_path, notice: "Successfully created INFLUENCER account"

    end
    # byebug

    # redirect_to root_path, notice: "Successfully created Influencer account"

  end
end
