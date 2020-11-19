ActiveAdmin.register OrderProduct do
  permit_params :quantity, :product_id
end
