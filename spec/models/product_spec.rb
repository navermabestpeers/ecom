require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a valid factory' do
    expect(build(:product)).to be_invalid
  end

  it 'is invalid without a title' do
    expect(build(:product, title: nil)).to be_invalid
  end

  it 'is invalid without a description' do
    expect(build(:product, description: nil)).to be_invalid
  end

  it 'is invalid without a price' do
    expect(build(:product, price: nil)).to be_invalid
  end

  it { should have_many(:lineitems) }
  it { should have_many(:reviews) }
  it { should belong_to(:user) }

  context 'db' do
    context 'columns' do
      it { should have_db_column(:title).of_type(:string) }
      it { should have_db_column(:description).of_type(:text) }
      it { should have_db_column(:price).of_type(:decimal) }
      it { should have_db_column(:user_id).of_type(:integer) }
    end
  end

  context 'attributes' do
    it 'has title' do
      expect(build(:product, title: 'Product ABC123')).to have_attributes(title: 'Product ABC123')
    end
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:user_id) }
  end
end
