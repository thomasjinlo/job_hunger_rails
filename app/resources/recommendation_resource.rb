class RecommendationResource < JSONAPI::Resource
  has_one :user
  has_one :recommendable, polymorphic: true 

  attributes :user_id, :start_date, :recommendable_type, :recommendable_id, :complete

  
end
