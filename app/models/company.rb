class Company < ActiveRecord::Base
  include Recommendable

  belongs_to :user
  has_many :leads, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :scores, as: :scoreable

  validates :name, presence: true
  validates :user_id, presence: true

  after_create :make_activity

  # Recommendable

  def recommendable_actions
    [
      {
        field: 'blog',
        query: "#{name} company blog",
        action: 'Add the company blog'
      },
      {
        field: 'website',
        query: "#{name} company website",
        action: 'Add the website'
      },
      {
        field: 'address',
        query: "#{name} company address",
        action: 'Add an address'
      }
    ]
  end

  private

  def make_activity
    user_id = user.id
    points = 111
    description = "User added company #{name} to profile"
    activity = Activity.new(
      user_id: user_id,
      points: points,
      description: description
    )
    activity.save
  end
end
