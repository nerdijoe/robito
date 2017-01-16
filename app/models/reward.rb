class Reward < ActiveRecord::Base

 	belongs_to :campaign

	# validates :target, presence: true, :message => "can't be empty"
	validates :target, 
          :presence => {:message => "Target can't be blank." }
    
    validates :prize, :presence => true
    validates :prize, :length => {:minimum => 2}

#     def a_method_used_for_validation_purposes
#     errors.add(:target, :invalid_characters)
# end
 

end
