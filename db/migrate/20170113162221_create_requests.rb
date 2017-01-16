class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :campaign, index:true
      t.references :influencer, index:true

      t.timestamps null: false
    end
  end
end
