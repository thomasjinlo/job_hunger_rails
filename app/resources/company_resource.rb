class CompanyResource < JSONAPI::Resource
  has_one :user
  has_many :jobs
  has_many :leads

  attributes :name, :notes, :interest, :website, :blog, :address

  after_create :generate_recommendation
  

  def generate_recommendation
    recommendations = [
      "Do some google-ing to find #{@model.name}'s tech blog", 
      "Gather some cool facts about #{@model.name}"
    ]
    action = recommendations.sample
    Recommendation.create(recommendable_type: @model.class, recommendable_id: @model.id, completed: false, action: action, user_id: @model.user.id, start_date: DateTime.now + rand(1..3))
  end


end


