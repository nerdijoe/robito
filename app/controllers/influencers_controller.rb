class InfluencersController < ApplicationController
  def index
    @influencers = Influencer.all
    # @user = current_user
    # @campaigns = current_user.influencer.campaigns
    @campaigns = current_user.influencer.campaigns.order(created_at: :desc)

  end

  def show
    @influencer = Influencer.find(params[:id])

    @client = Instagram.client(access_token: @influencer.user.instagram.accesstoken)
    @recent = @client.user_recent_media

    byebug
    # find a post with specified hastag
    @tag = "yatai"
    # @found_post = nil
    @recent.each do |m|

      if m.tags.include?(@tag)
        @found_post = m
        # byebug
        return
      end
    end


  end


end
