class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def onSale
    @products = Product.includes(:category).where(onSale: [true, nil]).page(params[:page])
  end

  def new
    @products = Product.includes(:category).where("created_at > ?", 3.days.ago).page(params[:page])
  end
end
