class WelcomeController < ApplicationController
  before_action :authenticate_user!



  def index
    @client = Instagram.client(access_token: current_user.instagram.accesstoken)
    @recent = @client.user_recent_media
  end
end
