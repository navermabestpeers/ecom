require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'has a valid factory' do
    expect(build(:address)).to be_invalid
  end

  it 'is invalid without a address_1' do
    expect(build(:address, address_1: nil)).to be_invalid
  end

  it 'is invalid without a address_2' do
    expect(build(:address, address_2: nil)).to be_invalid
  end

  it 'is invalid without a city' do
    expect(build(:address, city: nil)).to be_invalid
  end

  it 'is invalid without a state' do
    expect(build(:address, state: nil)).to be_invalid
  end

  it 'is invalid without a country' do
    expect(build(:address, country: nil)).to be_invalid
  end

  it 'is invalid without a postal code' do
    expect(build(:address, postal_code: nil)).to be_invalid
  end

  it { should belong_to(:user) }

  context 'db' do
    context 'columns' do
      it { should have_db_column(:address_1).of_type(:text) }
      it { should have_db_column(:address_2).of_type(:text) }
      it { should have_db_column(:city).of_type(:string) }
      it { should have_db_column(:state).of_type(:string) }
      it { should have_db_column(:country).of_type(:string) }
      it { should have_db_column(:postal_code).of_type(:string) }
      it { should have_db_column(:user_id).of_type(:integer) }
    end
  end

  context 'attributes' do
    it 'has address_1' do
      expect(build(:address, address_1: 'ABC123')).to have_attributes(address_1: 'ABC123')
    end
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:address_1) }
    it { is_expected.to validate_presence_of(:address_2) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:postal_code) }
    it { is_expected.to validate_presence_of(:user_id) }
  end
end
