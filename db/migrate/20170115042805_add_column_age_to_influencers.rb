class AddColumnAgeToInfluencers < ActiveRecord::Migration
  def change
    add_column :influencers, :age, :integer
  end
end
