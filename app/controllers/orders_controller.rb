class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @user = User.find(params[:user_id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(whitelist_order_params)
    if @order.save
      flash[:success] = "Add products here and place you order."
      redirect_to new_ordercontent_path, locals: {order_id: @order.id}
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
