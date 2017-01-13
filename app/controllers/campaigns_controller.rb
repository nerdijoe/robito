class CampaignsController < ApplicationController


def show 
@campaign = Campaign.where(user_id: current_user.id)
end


def index 
	# @user = User.find_by_id(params[:user_id])
	@campaign = Campaign.where(user_id: current_user.id)
	 # byebug
# @user = User.find_by_id(params[:user_id])
# @campaign = Campaign.user
end 
	def new
		# @campaign = Campaign.new
		# byebug
		@campaign = current_user.campaigns.new
	end


	def create
		# @campaign = Campaign.new(campaigns_params)
		@campaign = current_user.campaigns.new(campaigns_params)
		if @campaign.save
					redirect_to welcome_index_path
			flash[:notice] = "successfully Added Campaign"
 				else
 			redirect_to root_path

 					flash[:notice] = "Error"
		end
	end

	def edit
@campaign = Campaign.find(params[:id])
@user = User.find_by_id(params[:user_id])
	end
	
	def update
	@campaign = Campaign.find(params[:id])
	if @campaign.update(campaigns_params_edit)
	redirect_to user_campaigns_path(current_user)
	else
		root_path
	end
	end

	def destroy

	end

private
def campaigns_params_edit
	params.require(:campaign).permit(:product_category, :description, :product_name, :company_name, :email, :phone_number, :address, :link, {image: []})

	end
	def campaigns_params
	params.require(:campaign).permit(:product_category, :description, :product_name, :company_name, :email, :phone_number, :address, :link, {image: []}, :user_id)
 	end

end
