class RemoveRefUserInCampaigns < ActiveRecord::Migration
  def change
    remove_reference :campaigns, :user, index:true
  end
end
