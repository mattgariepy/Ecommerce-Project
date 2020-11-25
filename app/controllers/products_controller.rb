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

  def search
    search = "%#{params[:keywords]}%"
    dropdown = "#{params[:category]}"
    category = Category.where("name LIKE ?", dropdown)

    if(dropdown == "All Categories")
      @products = Product.includes(:category).where("name LIKE (?) OR description LIKE (?)", search, search).page(params[:page])
    else
      @products = Product.includes(:category).where("name LIKE (?) OR description LIKE (?)", search, search).where(category_id: category.ids).page(params[:page])
    end
  end
end
