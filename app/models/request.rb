class Request < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :influencer

  enum status: [ :pending , :ongoing, :ended, :rejected ]

end
