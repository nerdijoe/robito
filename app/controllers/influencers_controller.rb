class InfluencersController < ApplicationController
  def index
    # @influencers = Influencer.all
    # @user = current_user
    # @campaigns = current_user.influencer.campaigns
    @campaigns = current_user.influencer.campaigns.order(created_at: :desc)

    @pending_requests = current_user.influencer.requests.pending
    @ongoing_requests = current_user.influencer.requests.ongoing
  end

  def show
    @influencer = Influencer.find(params[:id])

    @client = Instagram.client(access_token: @influencer.user.instagram.accesstoken)
    @user_info = @client.user
    @recent = @client.user_recent_media

    byebug
    # find a post with specified hastag
    @tag = "relaxing"
    # @found_post = nil
    @recent.each do |m|

      if m.tags.include?(@tag)
        @found_post = m
        # byebug
        return
      end
    end

  end

  def edit
    @influencer = current_user.influencer
  end

  def update
    @influencer = current_user.influencer

    if @influencer.update_attributes(influencer_params)
      redirect_to influencer_path(@influencer.id)
    else
      flash[:alert] = "Sorry, we cannot update your profile"
      render 'edit'
    end

  end

  def destroy
     @influencer = Influencer.find(params[:id])
    if @influencer.destroy
      current_user.zero!
      redirect_to root_path, notice: "Successfully account DELETED"
    else
      redirect_to influencer_path(current_user.influencer), notice: "Unuccessfully account Deleted"
    end

  end

  private
  def influencer_params
    params.require(:influencer).permit(:product_category, :location, :age, :gender, :interests )

  end


end
