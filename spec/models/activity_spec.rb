require 'rails_helper'

RSpec.describe Activity, type: :model do

  let(:activity) { build(:activity) }

  it 'is valid with default attributes' do
    expect(activity).to be_valid
  end

  it 'is not valid without user_id' do
    activity.user_id = nil
    expect(activity).to_not be_valid
  end

  it 'is not valid without points' do
    activity.points = nil
    expect(activity).to_not be_valid
  end

  describe Activity do
    it { should belong_to(:user) }
    it { should belong_to(:scoreable)}
    it { should validate_presence_of(:points) }
  end

end
