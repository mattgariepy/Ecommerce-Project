ActiveAdmin.register AboutContact do
  permit_params :aboutTitle, :aboutText, :contactNumber, :contactEmail, :contactTitle, :contactText
end
