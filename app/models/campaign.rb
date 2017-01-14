class Campaign < ActiveRecord::Base
	belongs_to :brand
	has_many :requests
	has_many :influencers, through: :requests
	has_many :rewards

	mount_uploaders :image, AvatarUploader

	# enum age: [ 0: 'Younger than 20', :'20 to 30' , :'30 to 40', :'30 to 40', :'50 and above' ]
	enum age: {'Younger than 20' => 0, '20 to 30' => 1, '30 to 40' => 2, '50 and above' => 3 }
	enum gender: [ :Male, :Female, :Both]
end
