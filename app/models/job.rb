class Job < ActiveRecord::Base
  belongs_to :company
  has_many :recommendations, as: :recommendable
  has_many :scores, as: :scoreable

  STATUSES = %w(Interested Applied Rejected Interview Offer)

  validates :title, presence: true, length: { minimum: 1}
  validates :company_id, presence: true
  # validates :application_status, inclusion: { in: STATUSES }

  before_create :set_default 
  after_create :make_activity


  private

  def set_default
    self.application_status ||= "Interested"
  end

  def make_activity
    user_id = company.user.id
    points = 202
    description = "User added job #{title} to profile"
    activity = Activity.new(user_id: user_id,
                            points: points,
                            description: description)
    activity.save
  end


end
