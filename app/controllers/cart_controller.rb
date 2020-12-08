class CartController < ApplicationController
  def create
    id = params[:id].to_i
    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      product = Product.find(id)
      flash[:notice] = "#{product.name} added to cart!"
      # redirect_to root_path
    end
  end

  def destroy
    id = params[:id].to_i
    product = Product.find(id)
    session[:shopping_cart].delete(id)
    flash[:notice] = "#{product.name} removed from cart!"
    # redirect_to root_path
  end
end
