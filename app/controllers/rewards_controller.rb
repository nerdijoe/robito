class RewardsController < ApplicationController

	def index

		@reward = Reward.all
	end
	def show
	@reward = Reward.find(params[:id])
	end

	def new
		@campaign = Campaign.find params[:campaign_id]
		@reward = @campaign.rewards.new
	end

	def create
		 @campaign = Campaign.find params[:campaign_id]
				# @reward = Reward.new(rewards_params)
		@reward = @campaign.rewards.new(rewards_params)
				if @reward.save
			redirect_to root_path
			flash[:notice] = "Has been added"
		else
				redirect_to root_path
		end		
	end

	def edit
	 	@campaign = Campaign.find params[:campaign_id]
		@reward = Reward.find(params[:id])
	end

	def update 
	 	@reward = Reward.find(params[:id])
		@reward.update(rewards_params_update)
		redirect_to brand_campaign_path(id: @reward.campaign.id, brand_id: current_user.brand.id)
	end

	def destroy
		 # @campaign = Campaign.find(params[:campaign_id])
		# @campaign = Campaign.find(params[:id])
 		@reward = Reward.destroy(params[:id])
  		# redirect_to brand_campaign_path(brand_id: current_user.brand.id)
  		redirect_to root_path 
 		flash[:notice] = "Gone Bro!!!!!"
 	end

	private
	def rewards_params_update
		params.require(:reward).permit(:target, :prize, :description, :post_date, :deadline)
 	end
 	def rewards_params
		params.require(:reward).permit(:target, :prize, :description, :post_date, :deadline, :campaign_id)
 	end
 
end
