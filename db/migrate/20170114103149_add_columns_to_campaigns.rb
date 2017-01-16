class AddColumnsToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :tag, :string
    add_column :campaigns, :location, :string
    add_column :campaigns, :age, :integer
    add_column :campaigns, :gender, :integer
    add_column :campaigns, :interests, :string
  end
end
