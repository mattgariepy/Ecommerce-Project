require 'nokogiri'
require 'httparty'


OrderItem.destroy_all
Order.destroy_all
OrderProduct.destroy_all
Customer.destroy_all
Province.destroy_all
Product.destroy_all
Category.destroy_all


sheltersURL = 'https://www.cabelas.ca/search?n=0&category3=Ice+Shelters+%26+Sleds&pagesize=60'
shelterUnParsed = HTTParty.get(sheltersURL)

if shelterUnParsed.body.nil?
  puts "No Respones From Shelters :("
else
  shelterParsed = Nokogiri::HTML(shelterUnParsed)
  shelterListings = shelterParsed.css('article.productCard')
  shelterCategory = Category.find_or_create_by(name: 'Shelters')

  shelterListings.each do |shelter|
    #Get Info From First Page
    shelterName = shelter.css('h6.productCard-heading').text
    shelterPriceString = shelter.css('span.price-primary').text
    shelterPrice = shelterPriceString.to_s.tr!('$,','').to_d

    #Go to Each Shelters page to get description
    shelterUrl = "https://www.cabelas.ca" + shelter.css('a')[0].attributes["href"].value
    shelterUNParsed = HTTParty.get(shelterUrl)

    if shelterUNParsed.body.nil?
      puts "No Respones From Shelter Page :("
    else
      shelterParsed = Nokogiri::HTML(shelterUNParsed)
      shelterDescription = shelterParsed.css('div.col.width-threeFifths.wysiwyg').text

      #Create Products
      createdShelter = shelterCategory.products.create(
        name: shelterName,
        price: shelterPrice,
        description: shelterDescription,
        onSale: false,
      )
    end
  end
end

augersURL = 'https://www.cabelas.ca/search?n=0&category3=Ice%20Augers'
augerUnParsed = HTTParty.get(augersURL)

if augerUnParsed.body.nil?
  puts "No Respones From Augers :("
else
  augerParsed = Nokogiri::HTML(augerUnParsed)
  augerListings = augerParsed.css('article.productCard')
  augerCategory = Category.find_or_create_by(name: 'Augers')

  augerListings.each do |auger|
    #Get Info From First Page
    augerName = auger.css('h6.productCard-heading').text
    augerPriceString = auger.css('span.price-primary').text
    augerPrice = augerPriceString.to_s.tr!('$,','').to_d

    #Go to Each Augers page to get description
    augerUrl = "https://www.cabelas.ca" + auger.css('a')[0].attributes["href"].value
    augerUNParsed = HTTParty.get(augerUrl)

    if augerUNParsed.body.nil?
      puts "No Respones From Auger Page :("
    else
      augerParsed = Nokogiri::HTML(augerUNParsed)
      augerDescription = augerParsed.css('div.col.width-threeFifths.wysiwyg').text

      #Create Products
      createdAuger = augerCategory.products.create(
        name: augerName,
        price: augerPrice,
        description: augerDescription,
        onSale: false,
      )
    end
  end
end

heatersURL = 'https://www.cabelas.ca/search?n=0&category3=Heaters'
heaterUnParsed = HTTParty.get(heatersURL)

if heaterUnParsed.body.nil?
  puts "No Respones From Heaters :("
else
  heaterParsed = Nokogiri::HTML(heaterUnParsed)
  heaterListings = heaterParsed.css('article.productCard')
  heaterCategory = Category.find_or_create_by(name: 'Heaters')

  heaterListings.each do |heater|
    #Get Info From First Page
    heaterName = heater.css('h6.productCard-heading').text
    heaterPriceString = heater.css('span.price-primary').text
    heaterPrice = heaterPriceString.to_s.tr!('$,','').to_d

    #Go to Each Heaters page to get description
    heaterUrl = "https://www.cabelas.ca" + heater.css('a')[0].attributes["href"].value
    heaterUNParsed = HTTParty.get(heaterUrl)

    if heaterUNParsed.body.nil?
      puts "No Respones From Heater Page :("
    else
      heaterParsed = Nokogiri::HTML(heaterUNParsed)
      heaterDescription = heaterParsed.css('div.col.width-threeFifths.wysiwyg').text

      #Create Products
      createdHeater = heaterCategory.products.create(
        name: heaterName,
        price: heaterPrice,
        description: heaterDescription,
        onSale: false,
      )
    end
  end
end

electronicsURL = 'https://www.cabelas.ca/search?n=0&category3=Ice%20Electronics'
electronicUnParsed = HTTParty.get(electronicsURL)

if electronicUnParsed.body.nil?
  puts "No Respones From Electronics :("
else
  electronicParsed = Nokogiri::HTML(electronicUnParsed)
  electronicListings = electronicParsed.css('article.productCard')
  electronicCategory = Category.find_or_create_by(name: 'Electronics')

  electronicListings.each do |electronic|
    #Get Info From First Page
    electronicName = electronic.css('h6.productCard-heading').text
    electronicPriceString = electronic.css('span.price-primary').text
    electronicPrice = electronicPriceString.to_s.tr!('$,','').to_d

    #Go to Each Electronics page to get description
    electronicUrl = "https://www.cabelas.ca" + electronic.css('a')[0].attributes["href"].value
    electronicUNParsed = HTTParty.get(electronicUrl)

    if electronicUNParsed.body.nil?
      puts "No Respones From Electronic Page :("
    else
      electronicParsed = Nokogiri::HTML(electronicUNParsed)
      electronicDescription = electronicParsed.css('div.col.width-threeFifths.wysiwyg').text

      #Create Products
      createdElectronic = electronicCategory.products.create(
        name: electronicName,
        price: electronicPrice,
        description: electronicDescription,
        onSale: false,
      )
    end
  end
end

puts "Created #{Product.count} products"
puts "Created #{Category.count} categories"
# puts "Created #{OrderItem.count} order items"
# puts "Created #{Order.count} orders"
# puts "Created #{OrderProduct.count} order products"
# puts "Created #{Customer.count} customers"
# puts "Created #{Province.count} provinces"

#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?