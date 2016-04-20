class Recommendation < ActiveRecord::Base
  belongs_to :user
  belongs_to :recommendable, polymorphic: true

  # validates :user_id, presence: true
  # validates :recommendable_type, presence: true
  # validates :recommendable_id, presence: true
  # validates :action, presence: true
  # validates :completed, presence: true

end
