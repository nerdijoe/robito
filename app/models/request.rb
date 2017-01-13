class Request < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :influencer
end
