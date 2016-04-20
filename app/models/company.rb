class Company < ActiveRecord::Base
  belongs_to :user
  has_many :leads, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :recommendations, as: :recommendable, dependent: :destroy
  has_many :scores, as: :scoreable


  validates :name, presence: true
  validates :user_id, presence: true


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


