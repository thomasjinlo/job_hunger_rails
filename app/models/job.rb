class Job < ActiveRecord::Base
  belongs_to :company
  has_many :recommendations, as: :recommendable
  has_many :scores, as: :scoreable

  after_create :make_activity

  private
  def make_activity
    user_id = company.user.id
    points = 202
    description = "User added job #{title} to profile"
    activity = Activity.new({
      user_id: user_id,
      points: points,
      description: description
      })
    activity.save
  end
end
