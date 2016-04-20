class Lead < ActiveRecord::Base
  belongs_to :company
  has_many :recommendations, as: :recommendable
  has_many :scores, as: :scoreable


  validates :name, presence: true
  validates :company_id, presence: true


  after_create :make_activity

  private
  def make_activity
    user_id = company.user.id
    points = 321
    description = "User added lead #{name} to profile"
    activity = Activity.new({
      user_id: user_id,
      points: points,
      description: description
      })
    activity.save
  end

end
