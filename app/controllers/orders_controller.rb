class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @orders = Order.all
  end


  def show
    @order = Order.find(params[:id])
  end


  def new
    @order = Order.new
  end

  def edit
  end


  def create
    product_id = order_params[:product_id]
    if product_id && prod = Product.where(id: product_id)
      associated_product = prod.first
    end

    @order = Order.new(user_id: current_user.id, started_at: Time.now)

    respond_to do |format|
      if @order.save
        if associated_product &&  associated_product.order_id = @order.id
          associated_product.save
        end
        format.html { redirect_to cart_path, notice: 'item added to cart' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    p = @order.product
    if p
      p.order_id = nil
      p.save
    end
    @order.destroy
    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'item removed from cart' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.permit(:product_id)
  end
end
