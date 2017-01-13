class InfluencersController < ApplicationController
  def index
    @influencers = Influencer.all
  end

  def show
    @influencer = Influencer.find(params[:id])

    @client = Instagram.client(access_token: @influencer.user.instagram.accesstoken)
    @recent = @client.user_recent_media

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


    byebug
  end
end
