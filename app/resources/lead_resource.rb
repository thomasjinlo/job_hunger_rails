class LeadResource < JSONAPI::Resource
  has_one :company

  attributes :name, :linked_in, :blog, :email, :notes

  after_create :generate_recommendations

  def generate_recommendations
    Lead::RECOMMENDATIONS.each do |action|
      Recommendation.create(recommendable_type: @model.class, recommendable_id: @model.id, completed: false, action: action, user_id: @model.company.user.id, start_date: DateTime.now + rand(1..3))
    end
  end
end
