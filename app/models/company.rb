class Company < ActiveRecord::Base
  belongs_to :user
  has_many :leads, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :recommendations, as: :recommendable, dependent: :destroy
  has_many :scores, as: :scoreable

  validates :name, presence: true
  validates :user_id, presence: true

  after_create :make_activity
  after_create :get_glassdoor_info

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

  def get_glassdoor_info
    base_string = "http://api.glassdoor.com/api/api.htm"

    partner_str = "t.p=" + ENV['GLASSDOOR_PARTNER'].to_s
    key_str =  "t.k=" + ENV['GLASSDOOR_KEY'].to_s
    query_str = "q="+ name
    format_str = "format=json"
    version_str = "v=1"
    action_str = "action=employers"

    query_arr = [
      partner_str,
      key_str,
      query_str,
      format_str,
      version_str,
      action_str
    ]

    request_string = base_string + "?" + query_arr.join("&")
    puts request_string
    glassdoor_response = HTTParty.get( request_string )
    # puts glassdoor_response

    glassdoor_website = glassdoor_response.employers[0].website
    glassdoor_rating =  glassdoor_response.employers[0].overallRating
    glassdoor_logo_link = glassdoor_response.employers[0].squareLogo

  end

end


