class Influencer < ActiveRecord::Base
  # devise :omniauthable
  # has_many :campaigns, foreign_key: "influencer_id"
  belongs_to :user

  has_many :requests
  has_many :campaigns, through: :requests

  enum product_category: { 'Fashion' => 0, 'Beauty Products'=> 2, 'Food' => 3, 'Other' => 4 }
  enum location: { 'Malaysia' => 0, 'Indonesia' => 1, 'Singapore' => 2, 'Vietnam' => 3, 'Thailand' => 4 , 'Cambodia' => 5 }
  enum age: { 'Younger than 20' => 0, '20 to 30' => 1, '30 to 40' => 2, '50 and above' => 3 }
	enum gender: [ :Male, :Female, :Both ]


  scope :location,    -> (city) { where(location: city) }
  scope :age,         -> (age) { where(age: age) }
  scope :gender,         -> (gender) { where(gender: gender) }
  scope :interests,         -> (interests) { where("interests like ? ", "%#{interests}%") }

  include PgSearch
  pg_search_scope :search_by_keyword, :against => [:product_category, :location, :age, :gender, :interests]

  pg_search_scope :search_by_keyword_all, :against => [:product_category, :location, :age, :gender, :interests], :using => { :tsearch => {:any_word => true}  }


  def search_male

  end
end
