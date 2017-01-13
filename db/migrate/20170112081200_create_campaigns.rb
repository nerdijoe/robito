class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|

            t.belongs_to :user, index: true

    	t.text :description
    	t.string :product_category
    	t.string :product_name
    	t.string :company_name
    	t.string :email
    	t.integer :phone_number
    	t.string :address
    	t.string :link
    	t.json   :image 
      t.timestamps null: false
    end
  end
end
