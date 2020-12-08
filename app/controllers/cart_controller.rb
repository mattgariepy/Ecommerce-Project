class CartController < ApplicationController
  def create
    id = params[:id].to_i
    session[:shopping_cart] << id unless session[:shopping_cart].include?(id)
    flash[:notice] = "Item added to cart!"
    # redirect_to root_path
  end

  def destroy

  end
end
