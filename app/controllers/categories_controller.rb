class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:products)
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where(category_id: params[:id])
  end
end
