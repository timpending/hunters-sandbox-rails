class UsersController < ApplicationController
  before_action :authenticate_user!


  def hunt
    if params[:search_term]
      search_term = params[:search_term]
      @searching = true;
      term =  "%#{search_term.downcase}%"
      @products = Product.unclaimed.where("LOWER(name) LIKE ? OR LOWER(description) LIKE ?", term, term)
    end
  end

  def sell

  end

  def feed

  end

end
