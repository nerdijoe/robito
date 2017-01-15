class AddColumnsToInfluencers < ActiveRecord::Migration
  def change
    add_column :influencers, :product_category, :integer
    add_column :influencers, :location, :integer
    add_column :influencers, :gender, :integer
  end
end
