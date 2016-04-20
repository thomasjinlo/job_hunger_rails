require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let( :lead ) { build( :lead ) }
  let( :user ) { build( :user ) }
  let( :recommendation ) do
    build( :recommendation, {recommendable: lead, user: user} ) 
  end

  it "is valid with default attributes" do
    expect( recommendation ).to be_valid
  end

  it "is not valid without user_id" do 
    recommendation.user = nil
    expect( recommendation ).to_not be_valid
  end

  it "is not valid without recommendable_type" do 
    recommendation.recommendable= nil
    expect( recommendation ).to_not be_valid
  end

  it "is not valid without action" do 
    recommendation.action = nil
    expect( recommendation ).to_not be_valid
  end

end
