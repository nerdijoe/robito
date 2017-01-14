class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index

    if current_user.zero?
      redirect_to users_roles_new_path
    elsif current_user.brand.present?
      redirect_to brands_path
    elsif current_user.influencer.present?
      redirect_to influencers_path
    else

    end

  end

  def user_recent_media

    if current_user.identities.where(provider: 'instagram').count > 0
      @client = Instagram.client(access_token: current_user.instagram.accesstoken)
      @recent = @client.user_recent_media

    else

    end

  end

  def influencers
    @influencers = User.where(type: "Influencer")
    byebug
  end

end
