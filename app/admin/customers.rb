ActiveAdmin.register Customer do
  permit_params :name, :email, :address, :postalCode, :province_id
end
