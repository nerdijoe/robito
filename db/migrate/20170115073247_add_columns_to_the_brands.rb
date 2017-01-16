class AddColumnsToTheBrands < ActiveRecord::Migration
  def change

  	add_column :brands, :brand_name, :string
    add_column :brands, :description, :text
    add_column :brands, :company_name, :string
    add_column :brands, :email, :string
    add_column :brands, :phone_number, :integer
    add_column :brands, :address, :string
    add_column :brands, :link, :string
    add_column :brands, :image, :json

   end
end
