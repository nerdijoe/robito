class Reward < ActiveRecord::Base

 	belongs_to :campaign

	# validates :target, presence: true, :message => "can't be empty"
	validates :target, 
          :presence => {:message => "Title can't be blank." }
    
    validates :prize, :presence => true
    validates :prize, :length => {:minimum => 2}
end
