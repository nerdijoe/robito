class AddRefBrandInCampaigns < ActiveRecord::Migration
  def change
    add_reference :campaigns, :brand, index:true, foreign_key:true
  end
end
