class CompanyResource < JSONAPI::Resource
  has_one :user
  has_many :jobs
  has_many :leads

  attributes :name, :notes, :interest, :website, :blog, :address

  after_create :generate_recommendations


  def generate_recommendations
    Company::RECOMMENDATIONS.each do |action|
      Recommendation.create(recommendable_type: @model.class, recommendable_id: @model.id, completed: false, action: action, user_id: @model.user.id, start_date: DateTime.now + rand(1..3))
    end
  end


end
