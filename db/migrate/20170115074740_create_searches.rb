class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keyword
      t.string :product_category
      t.string :location
      t.string :age
      t.string :gender
      t.string :interests

      t.timestamps null: false

    end
  end
end
