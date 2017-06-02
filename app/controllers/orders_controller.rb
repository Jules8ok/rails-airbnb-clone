class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @menu = Menu.find(params[:menu_id])

  end

  def new
    @menu = Menu.find(params[:menu_id])
    @order = Order.new
  end

  def edit
  end

  def create
  	@order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.menu_id = params[:menu_id]
    @menu = Menu.find(params[:menu_id])
    @order.amount = @menu.price * @order.quantity

    if @order.save
      redirect_to menu_order_path(params[:menu_id], @order)
    else
      render :new
    end
  end

  def update
  	@order.update (order_params)
  end

  def destroy
  	@order.destroy
  end

  def myorders
    @myorders = Order.where(user_id: current_user.id).uniq
  end

  private

  def set_order
  	@order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:quantity, :pick_up, :price)
  end
end
