class CreativesController < ApplicationController
  layout "creative"

  def index
    redirect_to welcome_index_path if signed_in?
  end
end
