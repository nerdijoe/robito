class Request < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :influencer

  enum status: [ :pending , :ongoing, :ended, :rejected ]
  enum reward: [ :reward_yes, :reward_no]


end
