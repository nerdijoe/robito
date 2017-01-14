class Request < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :influencer

  enum status: [ :zero, :pending , :ongoing, :ended, :rejected ]

end
