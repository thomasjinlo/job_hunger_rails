require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:user) { build(:user) }

  it 'is valid with default attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without encrypted_password' do
    user.encrypted_password = nil
    expect { user.save }.to raise_error(ActiveRecord::StatementInvalid)
  end

  it "should not allow duplicate email" do
    create(:user)
    expect{ create(:user) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  describe User do
    it { should have_many(:activities) }
    it { should have_many(:leads) }
    it { should have_many(:companies) }
    it { should have_many(:jobs) }
    it { should have_many(:recommendations) }
    it { should validate_length_of(:email) }
    it { should validate_length_of(:password) }
  end

end
