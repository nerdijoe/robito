class Influencer < ActiveRecord::Base
  # devise :omniauthable
  # has_many :campaigns, foreign_key: "influencer_id"
  belongs_to :user

end
