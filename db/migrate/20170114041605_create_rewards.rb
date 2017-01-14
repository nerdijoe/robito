class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
           
        t.belongs_to :campaign, index: true, foreign_key: true
        t.integer :target
        t.string :prize 
        t.text :description
        t.date :post_date
        t.date :deadline

       t.timestamps null: false
    end
  end
end

        # t.belongs_to :campaign, index: true, foreign_key: true
