class UsersController < ApplicationController
  before_action :authenticate_user!


  def hunt
    if params[:q]
      search_term = params[:q]
      @searching = true;
      @products = Product.unclaimed.where("LOWER(name) LIKE ?", "%#{search_term.downcase}%")
    end

  end

  def sell

  end

  def feed

  end

end
