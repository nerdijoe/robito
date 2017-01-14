class CampaignsController < ApplicationController


	def show
		# @campaign = Campaign.where(brand_id: params[:brand_id])
		@campaign = Campaign.find(params[:id])
		@rewards = @campaign.rewards

	end


	def index
		# @user = User.find_by_id(params[:user_id])
		@campaign = Campaign.where(brand_id: current_user.brand.id)
		# byebug
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
		byebug
		if @campaign.save
			redirect_to brands_path
			flash[:notice] = "successfully Added Campaign"
 		else
 			redirect_to root_path
			byebug
			flash[:notice] = "Error"
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
			# byebug
			redirect_to brand_campaign_path(id: params[:id])
		else
			root_path
		end
	end

	def destroy

	end

private
	def campaigns_params_edit
		params.require(:campaign).permit(:product_category, :description, :product_name, :company_name, :email, :phone_number, :address, :link, {image: []}, :tag, :location, :age, :gender, :interests)
	end

	def campaigns_params
		params.require(:campaign).permit(:product_category, :description, :product_name, :company_name, :email, :phone_number, :address, :link, {image: []}, :brand_id, :tag, :location, :age, :gender, :interests)
 	end

end
