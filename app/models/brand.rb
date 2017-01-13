class Brand < User
  devise :omniauthable
  has_many :campaigns , foreign_key: "user_id"
end
