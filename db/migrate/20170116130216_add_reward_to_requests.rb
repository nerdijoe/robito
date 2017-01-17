class AddRewardToRequests < ActiveRecord::Migration
  def change
  	    add_column :requests, :reward, :integer, :default => 0, :null => false
  end
end
