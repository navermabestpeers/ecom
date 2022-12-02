require 'rails_helper'

RSpec.describe Lineitem, type: :model do

  it { should belong_to(:order) }
  it { should belong_to(:product) }

  context 'db' do
    context 'columns' do
      it { should have_db_column(:unit_price).of_type(:float) }
      it { should have_db_column(:quantity).of_type(:integer) }
      it { should have_db_column(:total_price).of_type(:integer) }
      it { should have_db_column(:order_id).of_type(:integer) }
      it { should have_db_column(:product_id).of_type(:integer) }
    end
  end

  context 'attributes' do
    it 'has unit price' do
      expect(build(:lineitem, unit_price: 50)).to have_attributes(unit_price: 50 )
    end
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:product_id) }
    it { is_expected.to validate_presence_of(:order_id) }
    it { is_expected.to validate_presence_of(:unit_price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:total_price) }
  end
end
