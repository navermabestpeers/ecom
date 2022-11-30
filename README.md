# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# ecom


now put this code in application controller 

 if !session[:order_id].nil?
        @order = Order.find(session[:order_id])
        @lineitems = @order.lineitems
        if !current_user.orders.last.nil? && current_user.orders.last.status == "processing"
          @lineitems.update!(order_id: current_user.orders.last.id )
          session.delete(:order_id) 
      ------------------- #this one--------------------------------------
       else
          @order.update!(status: "processing")
          current_user.orders << @order
        end
      end
