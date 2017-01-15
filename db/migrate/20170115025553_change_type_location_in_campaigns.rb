class ChangeTypeLocationInCampaigns < ActiveRecord::Migration
  def change
    remove_column :campaigns, :location
    add_column :campaigns, :location, :integer
  end
end
