class Lead < ActiveRecord::Base
  belongs_to :company
  has_many :recommendations, as: :recommendable

  RECOMMENDATIONS = ["Find their blog", "Connect with them on LinkedIn", "See if their company is hosting a Meetup"]
end
