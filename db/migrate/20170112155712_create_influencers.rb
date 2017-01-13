class CreateInfluencers < ActiveRecord::Migration
  def change
    create_table :influencers do |t|

      t.timestamps null: false
    end
  end
end
