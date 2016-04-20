class Company < ActiveRecord::Base
  belongs_to :user
  has_many :leads
  has_many :jobs
  has_many :recommendations, as: :recommendable
  has_many :scores, as: :scoreable


  after_create :make_activity

  private
  def make_activity
    user_id = user.id
    points = 111
    description = "User added company #{name} to profile"
    activity = Activity.new({
      user_id: user_id,
      points: points,
      description: description
      })
    activity.save
  end

end


