class AddStatusEnumToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :status, :integer, :default => 0, :null => false
  end
end
