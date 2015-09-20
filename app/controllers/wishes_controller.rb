class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /wishes
  # GET /wishes.json
  def index
    @wishes = Wish.all
  end

  # GET /wishes/1
  # GET /wishes/1.json
  def show
  end

  # GET /wishes/new
  def new
    @wish = Wish.new
  end

  # GET /wishes/1/edit
  def edit
  end

  # POST /wishes
  # POST /wishes.json
  def create
    @wish = Wish.new(wish_params.merge({user_id: current_user.id}))

    respond_to do |format|
      if @wish.save
        format.html { redirect_to wishlist_path, notice: 'Product added to wishlist.' }
      else
        format.html { redirect_to products_path, notice: 'Unable to add item to wish list' }
      end
    end
  end

  # PATCH/PUT /wishes/1
  # PATCH/PUT /wishes/1.json
  def update
    respond_to do |format|
      if @wish.update(wish_params)
        format.html { redirect_to @wish, notice: 'Wish was successfully updated.' }
        format.json { render :show, status: :ok, location: @wish }
      else
        format.html { render :edit }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishes/1
  # DELETE /wishes/1.json
  def destroy
    @wish.destroy
    respond_to do |format|
      format.html { redirect_to wishes_url, notice: 'Wish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_wishes
    product_id = params[:product]
    @wishes = Wish.where(product_id: product_id, user_id: current_user.id )
    if @wishes
      @wishes.destroy_all
      notice = "This item has been removed from your wish list";
    else
      notice = "Error deleting item from your wish list";
    end

    respond_to do |format|
      format.html { redirect_to products_path, notice: notice }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish
      @wish = Wish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wish_params
      params.permit(:notes, :user_id, :product_id)
    end
end
