require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_invalid
  end

  it 'is invalid without a name' do
    expect(FactoryBot.build(:user, name: nil)).to be_invalid
  end

  it 'is invalid without a email' do
    expect(FactoryBot.build(:user, email: nil)).to be_invalid
  end

  it 'is invalid without a phone' do
    expect(FactoryBot.build(:user, phone: nil)).to be_invalid
  end

  it { should have_many(:products) }
  it { should have_many(:orders) }
  it { should have_many(:reviews) }
  it { should have_one(:address) }

  context 'db' do
    context 'columns' do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:phone).of_type(:integer) }
    end
  end

  context 'attributes' do
    it 'has name' do
      expect(FactoryBot.build(:user, name: 'ABC123')).to have_attributes(name: 'ABC123')
    end
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:email) }
  end
end