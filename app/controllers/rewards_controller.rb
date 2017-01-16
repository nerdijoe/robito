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
			redirect_to root_path, notice: "Successfully created reward"
		else
			redirect_to new_campaign_reward_path(@campaign.id)
			flash[:notice] = "Error"

		end		
	end

	def edit
	 	@campaign = Campaign.find params[:campaign_id]
		@reward = Reward.find(params[:id])
	end

	def update 
	 	@reward = Reward.find(params[:id])
		if @reward.update(rewards_params_update)
			redirect_to brand_campaign_path(id: @reward.campaign.id, brand_id: current_user.brand.id), notice: "Successfully updated"
		else
			redirect_to brand_campaign_path(id: @reward.campaign.id, brand_id: current_user.brand.id), notice: "Error"
	end
	end

	def destroy
		 # @campaign = Campaign.find(params[:campaign_id])
		# @campaign = Campaign.find(params[:id])
 		if @reward = Reward.destroy(params[:id])
  		# redirect_to brand_campaign_path(brand_id: current_user.brand.id)
  		redirect_to root_path, notice: "Successfully Deleted reward"
  	else
  		redierct_to root_path
 		flash[:notice] = "Oops Error !!!!!"
 	end
	end
	private
	def rewards_params_update
		params.require(:reward).permit(:target, :prize, :description, :post_date, :deadline)
 	end
 	def rewards_params
		params.require(:reward).permit(:target, :prize, :description, :post_date, :deadline, :campaign_id)
 	end
 
end
