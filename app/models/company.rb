class Company < ActiveRecord::Base
  belongs_to :user
  has_many :leads
  has_many :recommendations, as: :recommendable


  RECOMMENDATIONS = ["Find their tech blog", "Research the company and add to the notes field"]


end
