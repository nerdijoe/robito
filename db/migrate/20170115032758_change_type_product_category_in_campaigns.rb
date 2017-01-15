class ChangeTypeProductCategoryInCampaigns < ActiveRecord::Migration
  def change
    remove_column :campaigns, :product_category
    add_column :campaigns, :product_category, :integer
  end
end
