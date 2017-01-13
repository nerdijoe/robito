class Influencer < ActiveRecord::Base
  # devise :omniauthable
  # has_many :campaigns, foreign_key: "influencer_id"
  belongs_to :user

  has_many :requests
  has_many :campaigns, through: :requests
end
