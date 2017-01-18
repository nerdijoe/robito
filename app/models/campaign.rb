class Campaign < ActiveRecord::Base
	belongs_to :brand
	has_many :requests
	has_many :influencers, through: :requests
	has_many :rewards, dependent: :destroy

	mount_uploaders :image, AvatarUploader

	validates :product_name,
	          :presence => {:message => "Product Name can't be blank." }

	validates :company_name, :presence => true
	validates :email, :presence => true

	enum product_category: { 'Fashion' => 0, 'Beauty Products'=> 2, 'Food' => 3, 'Other' => 4 }
	enum location: { 'Malaysia' => 0, 'Indonesia' => 1, 'Singapore' => 2, 'Vietnam' => 3, 'Thailand' => 4 , 'Cambodia' => 5 }
	enum age: { 'Younger than 20' => 0, '20 to 30' => 1, '30 to 40' => 2, '50 and above' => 3 }
	enum gender: [ :Male, :Female, :Both ]

	def check_status(influencer_id)
		self.requests.find_by(influencer_id: influencer_id).status
	end

	def get_request_to_influencer(id)
		self.requests.find_by(influencer_id: id)
	end

	def count_pending
		requests.where(status: 0).count
	end

	def count_ongoing
		requests.where(status: 1).count
	end

end
