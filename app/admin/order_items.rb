ActiveAdmin.register OrderItem do
  permit_params :order_id, :order_product_id
end
