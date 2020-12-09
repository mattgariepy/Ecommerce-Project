class HomeController < ApplicationController
  def index
    @new = Product.includes(:category).where("created_at > ?", 3.days.ago).limit(5)

    @sale = Product.includes(:category).where(onSale: [true, nil]).limit(5)
  end
end
