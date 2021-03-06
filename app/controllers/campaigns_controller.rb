class CampaignsController < ApplicationController
  	layout "application"


	def show
		# @campaign = Campaign.where(brand_id: params[:brand_id])
		@campaign = Campaign.find(params[:id])

		# @influencers = Influencer.all
		# @influencers = Influencer.where(location: @campaign.location)

		# show relevant influencers
		if current_user.brand.present?

			@influencers = Influencer.all.order(created_at: :asc)
			@influencers = @influencers.location(@campaign[:location]) if @campaign.location.present?
			@influencers = @influencers.age(@campaign[:age]) if @campaign.age.present?
	    @influencers = @influencers.gender(@campaign[:gender]) if @campaign.gender.present?
	    # @influencers = @influencers.interests(@campaign.interests) if @campaign.interests.present?
		end

		@rewards = @campaign.rewards

	end


	def index
		# @user = User.find_by_id(params[:user_id])
		@campaign = Campaign.where(brand_id: current_user.brand.id)
 		# @user = User.find_by_id(params[:user_id])
		# @campaign = Campaign.user
	end

	def new
		# @campaign = Campaign.new
		@campaign = current_user.brand.campaigns.new
	end


	def create
		# @campaign = Campaign.new(campaigns_params)
		# @campaign = current_user.campaigns.new(campaigns_params)
		@campaign = Campaign.new(campaigns_params)
		@campaign.brand_id = current_user.brand.id
 		if @campaign.save
			redirect_to brands_path
			flash[:notice] = "Successfully Added a new campaign"
 		else
 			redirect_to new_brand_campaign_path(current_user.brand)
 			flash[:notice] = "Error"
		 	flash[:notice] = "Product Name, Email, Company Name: can't be blank."

		end
	end

	def edit
		@campaign = Campaign.find(params[:id])
		# @user = User.find_by_id(params[:user_id])
	end

	def update
		@campaign = Campaign.find(params[:id])
		if @campaign.update(campaigns_params_edit)
			# redirect_to user_campaigns_path(current_user)
 			redirect_to brand_campaign_path(id: params[:id]), notice: "Successfully updated your campaign"
		else
 			redirect_to edit_brand_campaign_path(current_user.brand,id: params[:id])
		 	flash[:notice] = "Product Name, Email, Company Name: can't be blank."

		end
	end

	def destroy
		if @campaign = Campaign.destroy(params[:id])
			redirect_to root_path, notice: "Successfully Deleled campaign"
		else
			redirect_to root_path, notice: "Error"

		end
	end


	def influencers
		@campaign = Campaign.find(params[:id])


	end

	def influencersposts
		# get influencer
		@influencer = Influencer.find(params[:influencer_id])
		@campaign = Campaign.find(params[:id])

		@client = Instagram.client(access_token: @influencer.user.instagram.accesstoken)
		@recent = @client.user_recent_media

		# find a post with specified hastag
		@tag = @campaign.tag
		# @found_post = nil
		@recent.each do |m|

			if m.tags.include?(@tag)
				@found_post = m
				return
			end
		end

	end

private
	def campaigns_params_edit
		params.require(:campaign).permit(:product_category, :description, :product_name, :company_name, :email, :phone_number, :address, :link, {image: []}, :tag, :location, :age, :gender, :interests)
	end

	def campaigns_params
		params.require(:campaign).permit(:product_category, :description, :product_name, :company_name, :email, :phone_number, :address, :link, {image: []}, :brand_id, :tag, :location, :age, :gender, :interests)
 	end

end
