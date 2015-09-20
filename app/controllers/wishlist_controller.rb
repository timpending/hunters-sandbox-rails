class WishlistController < ApplicationController
  before_action :authenticate_user!

  def index
    @wished_items = current_user.wished_items
    #@wished_items = current_user.wishes
  end

end