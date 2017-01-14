class RequestsController < ApplicationController
  def create
    Request.create(campaign_id: params[:campaign_id], influencer_id: params[:influencer_id])

    byebug
    redirect_to brand_campaign_path(id: params[:campaign_id], brand_id: current_user.brand.id)
  end

  def update
    byebug
    request = Request.find(params[:id])

    if params[:request][:status] == 'Yes'
      request.status = 'ongoing'
    else
      request.status = 'rejected'
    end
    request.save

    byebug
    redirect_to influencer_campaign_path(id: request.campaign_id, influencer_id: current_user.influencer.id)
  end

  def destroy
    Request.where(campaign_id: params[:campaign_id], influencer_id: params[:influencer_id]).destroy_all
    byebug

    redirect_to brand_campaign_path(id: params[:campaign_id], brand_id: current_user.brand.id)
  end
end
