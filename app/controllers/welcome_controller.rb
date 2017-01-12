class WelcomeController < ApplicationController
  before_action :authenticate_user!



  def index
    redirect_to users_roles_new_path if current_user.zero?
  end

  def user_recent_media
    if current_user.identities.where(provider: 'instagram').count > 0
      @client = Instagram.client(access_token: current_user.instagram.accesstoken)
      @recent = @client.user_recent_media
    end

  end
end
