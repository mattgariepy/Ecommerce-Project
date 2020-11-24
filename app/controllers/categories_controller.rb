class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:products).page(params[:page])
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where(category_id: params[:id]).page(params[:page])
  end
end
