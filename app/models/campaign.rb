class Campaign < ActiveRecord::Base
	belongs_to :brand
	has_many :requests
	has_many :influencers, through: :requests
	has_many :rewards

	mount_uploaders :image, AvatarUploader


	enum product_category: { 'Fashion' => 0, 'Beauty Products'=> 2, 'Food' => 3, 'Other' => 4 }
	enum location: { 'Malaysia' => 0, 'Indonesia' => 1, 'Singapore' => 2, 'Vietnam' => 3, 'Thailand' => 4 , 'Cambodia' => 5 }
	enum age: { 'Younger than 20' => 0, '20 to 30' => 1, '30 to 40' => 2, '50 and above' => 3 }
	enum gender: [ :Male, :Female, :Both ]
end
