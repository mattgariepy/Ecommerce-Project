ActiveAdmin.register Order do
  permit_params :orderDate, :subTotal, :total, :gstAmount, :pstAmount, :hstAmount, :status, :customer_id
end
