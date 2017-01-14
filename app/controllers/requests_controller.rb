class RequestsController < ApplicationController
  def create
    Request.create(campaign_id: params[:campaign_id], influencer_id: params[:influencer_id])

    byebug
    redirect_to brand_campaign_path(id: params[:campaign_id], brand_id: current_user.brand.id)
  end

  def destroy
    Request.where(campaign_id: params[:campaign_id], influencer_id: params[:influencer_id]).destroy_all
    byebug

    redirect_to brand_campaign_path(id: params[:campaign_id], brand_id: current_user.brand.id)
  end
end
