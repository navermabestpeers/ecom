require 'rails_helper'

RSpec.describe Payment, type: :model do
  it 'has a valid factory' do
    expect(build(:payment)).to be_invalid
  end

  it 'is invalid without a payment_mode' do
    expect(build(:payment, payment_mode: nil)).to be_invalid
  end

  it 'is invalid without a order_id' do
    expect(build(:payment, order_id: nil)).to be_invalid
  end

  it { should belong_to(:order) }

  context 'db' do
    context 'columns' do
      it { should have_db_column(:payment_mode).of_type(:string) }
      it { should have_db_column(:order_id).of_type(:integer) }
    end
  end

  context 'attributes' do
    it 'has payment_mode,  order_id' do
      expect(build(:payment, payment_mode: 'COD')).to have_attributes(payment_mode: 'COD' )
      expect(build(:payment, order_id: 1)).to have_attributes(order_id: 1 )
    end
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:payment_mode) }
    it { is_expected.to validate_presence_of(:order_id) }
  end
end