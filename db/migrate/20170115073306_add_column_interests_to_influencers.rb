class AddColumnInterestsToInfluencers < ActiveRecord::Migration
  def change
    add_column :influencers, :interests, :string
  end
end
