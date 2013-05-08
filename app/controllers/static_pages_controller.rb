class StaticPagesController < ApplicationController
  def home
  	if signed_in?
	  @product = current_user.products.build
	  @feed_items = current_user.feed.paginate(page: params[:page])
   
	 # @nearby_users = @user.nearbys(10)
  end
  end

  def search
    @products = Product.search params[:search]
   
  end

  def help
  end

  def about
  end

  def contact
  end

  def sell
  if signed_in?
    @product = current_user.products.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
end
end
