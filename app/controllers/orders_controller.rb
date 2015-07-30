class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(whitelist_order_params)
    if @order.save
      flash[:success] = "New order created"
      redirect_to @category
    else
      flash.now[:danger] = 'Order was not saved, and error has occured.'
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
  
  end
  
  def whitelist_order_params
    params.require(:order).permit(:checkout_date , 
                                  :user_id ,   
                                  :shipping_id,
                                  :billing_id)

  end

end
