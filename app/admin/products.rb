ActiveAdmin.register Product do
  permit_params :name, :brand, :season, :description, :price, :onSale, :category_id
end
