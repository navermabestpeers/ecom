require 'rails_helper'

RSpec.describe Order, type: :model do

  it { should belong_to(:user).optional }
  it { should have_many(:lineitems) }
  it { should have_one(:payment) }

  context 'db' do
    context 'columns' do
      it { should have_db_column(:user_id).of_type(:integer) }
      it { should have_db_column(:status).of_type(:integer) }
    end
  end


  context 'validation' do
    #it { is_expected.to validate_presence_of(:subtotal) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:status) }
  end

  # describe '#total_price' do
  #   let!(:user) { User.create(params[:id]) }
  #     it 'this is for the total function' do    
  #       product = Product.create(:product, title:"abc",description: "adkjsfjslkdajdafkjha",user_id: user.id,price:10)   
  #       order = Order.create(:order, user_id: 1,status:"processing",subtotal:10)
  #       lineitem = Lineitem.create(:lineitem, order_id: order.id, product_id: product.id, quantity: 1, unit_price: 10, total_price: 10)
  #       order.subtotal = product.price * lineitem.quantity
  #       expect(order.subtotal).to eq(1000)
  #     end
  # end
end
