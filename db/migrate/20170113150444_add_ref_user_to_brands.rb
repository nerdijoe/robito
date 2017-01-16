class AddRefUserToBrands < ActiveRecord::Migration
  def change
    add_reference :brands, :user, index: true, foreign_key: true
  end
end
