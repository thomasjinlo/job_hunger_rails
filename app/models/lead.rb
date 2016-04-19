class Lead < ActiveRecord::Base
  belongs_to :company
  has_many :recommendations, as: :recommendable
end
