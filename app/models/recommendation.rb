class Recommendation < ActiveRecord::Base
  belongs_to :user
  belongs_to :recommendable, polymorphic: true

  validates :user, presence: true
  validates :recommendable, presence: true
  validates :action, presence: true, length: { in: 1..500 }
  validates :completed, inclusion: { in: [true, false] }
  validates :query, :field, :kind, :label, :link, length: { maximum: 500 }
end
