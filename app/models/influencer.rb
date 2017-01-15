class Influencer < ActiveRecord::Base
  # devise :omniauthable
  # has_many :campaigns, foreign_key: "influencer_id"
  belongs_to :user

  has_many :requests
  has_many :campaigns, through: :requests

  enum age: { 'Younger than 20' => 0, '20 to 30' => 1, '30 to 40' => 2, '50 and above' => 3 }

end
