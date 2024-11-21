require 'faker'

# Clear existing data
SavedItem.destroy_all
SearchHistory.destroy_all
Price.destroy_all
Market.destroy_all
Item.destroy_all
Category.destroy_all
User.destroy_all

# Seed Categories
categories = [
  { name: "Food and Groceries" },
  { name: "Electronics" },
  { name: "Clothing and Accessories" },
  { name: "Home and Living" },
  { name: "Health and Beauty" }
]

categories.each do |cat|
  Category.create!(name: cat[:name], slug: cat[:name].parameterize)
end

puts "Seeded #{Category.count} categories."

# Seed Items
Category.all.each do |category|
  5.times do
    item_name = Faker::Commerce.product_name
    Item.create!(
      name: item_name,
      slug: item_name.parameterize,
      description: Faker::Lorem.sentence,
      measurement: ["piece", "kg", "litre", "pack"].sample,
      image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['product']),
      category: category
    )
  end
end

puts "Seeded #{Item.count} items."

# Seed Markets
markets = [
  { name: "Makola Market", location: "Accra", market_type: "Market" },
  { name: "Kejetia Market", location: "Kumasi", market_type: "Market" },
  { name: "Melcom", location: "Nationwide", market_type: "Store" },
  { name: "Shoprite", location: "Nationwide", market_type: "Store" }
]

markets.each do |market|
  Market.create!(
    name: market[:name],
    slug: market[:name].parameterize,
    location: market[:location],
    market_type: market[:market_type]
  )
end

puts "Seeded #{Market.count} markets."

# Seed Prices
Item.all.each do |item|
  Market.all.each do |market|
    3.times do
      Price.create!(
        item: item,
        market: market,
        price: Faker::Commerce.price(range: 5.0..500.0),
        date_recorded: Faker::Date.between(from: 1.year.ago, to: Date.today)
      )
    end
  end
end

puts "Seeded #{Price.count} prices."

# Seed Users
users = [
  { email: "admin@example.com", password: "password", role: "admin" },
  { email: "user@example.com", password: "password", role: "general_user" },
  { email: "storeowner@example.com", password: "password", role: "store_owner" }
]

users.each do |user|
  User.create!(
    email: user[:email],
    password: user[:password],
    role: user[:role]
  )
end

puts "Seeded #{User.count} users."

# Seed Saved Items
User.where(role: "general_user").each do |user|
  3.times do
    SavedItem.create!(
      user: user,
      item: Item.all.sample
    )
  end
end

puts "Seeded #{SavedItem.count} saved items."

# Seed Search History
User.all.each do |user|
  5.times do
    SearchHistory.create!(
      user: user,
      search_term: Faker::Commerce.department(max: 1, fixed_amount: true)
    )
  end
end

puts "Seeded #{SearchHistory.count} search histories."

puts "Database seeding complete!"
