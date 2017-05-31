class OrdersController < ApplicationController
	def index
		@orders = Menu.all
	end

  # GET /chefs/1
  # GET /chefs/1.json
  def show
  end

  # GET /chefs/new
  def new
  	@order = Order.new
  end

  def edit
  end

  def create
  	@order = Order.new(menu_params)

  	respond_to do |format|
  		if @order.save
  			format.html { redirect_to @order, notice: 'Order was successfully created.' }
  			format.json { render :show, status: :created, location: @order }
  		else
  			format.html { render :new }
  			format.json { render json: @order.errors, status: :unprocessable_entity }
  		end
  	end
  end


  def update
  	respond_to do |format|
  		if @order.update(order_params)
  			format.html { redirect_to @order, notice: 'Order was successfully updated.' }
  			format.json { render :show, status: :ok, location: @order }
  		else
  			format.html { render :edit }
  			format.json { render json: @order.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def destroy
  	@order.destroy
  	respond_to do |format|
  		format.html { redirect_to order_url, notice: 'Order was successfully destroyed.' }
  		format.json { head :no_content }
  	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
    	@order = Order.find(params[:id])
    end
end
