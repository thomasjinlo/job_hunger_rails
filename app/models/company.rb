class Company < ActiveRecord::Base
  belongs_to :user
  has_one :company_info
  has_many :jobs
end
