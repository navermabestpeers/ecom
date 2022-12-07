require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'has a valid factory' do
    expect(build(:review)).to be_invalid
  end

  it 'is invalid without a rating' do
    expect(build(:review, rating: nil)).to be_invalid
  end

  it 'is invalid without a comment' do
    expect(build(:review, comment: nil)).to be_invalid
  end

  it 'is invalid without a user_id' do
    expect(build(:review, user_id: nil)).to be_invalid
  end

  it 'is invalid without a product_id' do
    expect(build(:review, product_id: nil)).to be_invalid
  end

  
  it { should belong_to(:product) }
  it { should belong_to(:user) }

  context 'db' do
    context 'columns' do
      it { should have_db_column(:rating).of_type(:integer) }
      it { should have_db_column(:comment).of_type(:text) }
      it { should have_db_column(:product_id).of_type(:integer) }
      it { should have_db_column(:user_id).of_type(:integer) }
    end
  end

  context 'attributes' do
    it 'has title' do
      expect(build(:review, rating: 5)).to have_attributes(rating: 5)
      expect(build(:review, comment: 'comment')).to have_attributes(comment: 'comment')
    end
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:rating) }
    it { is_expected.to validate_presence_of(:comment) }
    it { is_expected.to validate_presence_of(:product_id) }
    it { is_expected.to validate_presence_of(:user_id) }
  end
end
