ActiveAdmin.register Province do
  permit_params :name, :pstRate, :gstRate, :hstRate
end
