class RecommendationResource < JSONAPI::Resource
  has_one :user

  attributes :user_id, :start_date, :recommendable_type, :recommendable_id, :complete

  
end
