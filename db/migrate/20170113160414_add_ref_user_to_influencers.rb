class AddRefUserToInfluencers < ActiveRecord::Migration
  def change
    add_reference :influencers, :user, index: true, foreign_key: true
  end
end
