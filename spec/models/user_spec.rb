require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  subject { @user }

  context 'has valid factories' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_least(6) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end
end