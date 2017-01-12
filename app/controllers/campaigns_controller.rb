class CampaignsController < ApplicationController

	def new
		@campaign = Campaign.new

	end


	def create
		@campaign = Campaign.new(campaigns_params)
		if @campaign.save
					redirect_to welcome_index_path
			flash[:notice] = "successfully Added Campaign"
 				else
 			redirect_to root_path

 					flash[:notice] = "Error"
		end
	end

	def edit

	end

	def update

	end

	def destroy

	end

private
	def campaigns_params
	params.require(:campaign).permit(:product_category, :description, :product_name, :company_name, :email, :phone_number, :address, :link, :image)
 	end

end
