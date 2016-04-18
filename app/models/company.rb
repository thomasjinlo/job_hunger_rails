class Company < ActiveRecord::Base
  belongs_to :user
  has_many :leads
  has_many :jobs
end
