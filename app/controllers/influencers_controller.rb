class InfluencersController < ApplicationController
  def show
    @user = Influencer.find(params[:id])
  end
end
