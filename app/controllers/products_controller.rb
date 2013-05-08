class ProductsController < ApplicationController
  
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def create
    @product = current_user.products.build(params[:product])
    if @product.save
      flash[:success] = "Product is on the Market!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def index
   
    @products = Product.all
  end

  def destroy
    @product.destroy
    redirect_to root_url
  end

  

  private

    def correct_user
      @product = current_user.products.find_by_id(params[:id])
      redirect_to root_url if @product.nil?
    end
end