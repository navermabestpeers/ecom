class CartsController < ApplicationController
  def show
    @lineitems = current_order.lineitems
  end
end
