class Campaign < ActiveRecord::Base
	belongs_to :brand
	has_many :requests
	has_many :influencers, through: :requests
  	has_many :rewards

  	mount_uploaders :image, AvatarUploader

end
