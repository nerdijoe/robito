class Influencer < User
  devise :omniauthable
  # has_many :campaigns, foreign_key: "influencer_id"

end
