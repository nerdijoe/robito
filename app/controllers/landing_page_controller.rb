class LandingPageController < ApplicationController

  def index
    redirect_to welcome_index_path if signed_in?
  end

end
