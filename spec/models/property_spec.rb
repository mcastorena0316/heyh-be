require 'rails_helper'

RSpec.describe Property, type: :model do
  before do
    @property = build(:property)
  end

  subject { @property }

  context 'has valid factories' do
    it 'has a valid factory' do
      expect(build(:property)).to be_valid
    end
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:rental_price) }
    it { is_expected.to validate_presence_of(:tenant_email) }
    it { is_expected.to validate_presence_of(:tenant_name) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_inclusion_of(:status).in_array(%w[published available deleted]) }
  end
end
