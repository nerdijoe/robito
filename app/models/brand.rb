class Brand < ActiveRecord::Base
  # devise :omniauthable
  # has_many :campaigns , foreign_key: "user_id"
  belongs_to :user
  has_many :campaigns, dependent: :destroy
 
  mount_uploaders :image, AvatarUploader

end
