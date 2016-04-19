class Company < ActiveRecord::Base
  belongs_to :user
  has_many :leads
  has_many :recommendations, as: :recommendable


  RECOMMENDATIONS = ["Find their tech blog", "Add your research to the notes field"]


end
