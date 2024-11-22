require 'faker'

# Clear existing data
puts "Clearing existing data..."
SavedItem.destroy_all
SearchHistory.destroy_all
Price.destroy_all
Market.destroy_all
Item.destroy_all
Category.destroy_all
User.destroy_all

# Seed Categories
puts "Creating categories..."
categories = [
  { name: "Fruits and Vegetables" },
  { name: "Provisions" },
  { name: "Phones & Tablets" },
  { name: "Laptops" },
  { name: "Electronics" },
  { name: "Vehicles" },
  { name: "Property" },
  { name: "Building & Construction" }
]

categories.each do |cat|
  Category.create!(name: cat[:name], slug: cat[:name].parameterize)
end

# Seed Items with realistic names and measurements
puts "Creating items..."
items_data = {
  "Fruits and Vegetables" => [
    { name: "Fresh Tomatoes", measurement: "kg", description: "Fresh local tomatoes" },
    { name: "Onions", measurement: "kg", description: "Fresh red onions" },
    { name: "Garden Eggs", measurement: "kg", description: "Local garden eggs" },
    { name: "Plantain", measurement: "bunch", description: "Fresh green plantain" },
    { name: "Oranges", measurement: "bag", description: "Sweet local oranges" },
    { name: "Carrots", measurement: "kg", description: "Fresh carrots" },
    { name: "Cabbage", measurement: "head", description: "Fresh cabbage" },
    { name: "Green Pepper", measurement: "kg", description: "Fresh bell peppers" }
  ],
  "Provisions" => [
    { name: "Ideal Milk", measurement: "carton", description: "Nestle Ideal Milk" },
    { name: "Gino Tomato Paste", measurement: "box", description: "70g Gino tomato paste" },
    { name: "Frytol Oil", measurement: "litre", description: "Cooking oil" },
    { name: "Royal Aroma Rice", measurement: "kg", description: "Long grain rice" },
    { name: "Milo", measurement: "tin", description: "400g Nestle Milo" },
    { name: "Nido Milk Powder", measurement: "tin", description: "900g Nestle Nido" },
    { name: "Indomie Noodles", measurement: "carton", description: "40 pack carton" }
  ],
  "Phones & Tablets" => [
    { name: "iPhone 14 Pro", measurement: "Brand New", description: "256GB storage" },
    { name: "iPhone 13", measurement: "Used", description: "128GB storage" },
    { name: "Samsung S23", measurement: "Brand New", description: "256GB storage" },
    { name: "iPad Pro M2", measurement: "Brand New", description: "11-inch, 256GB" },
    { name: "Tecno Camon 20", measurement: "Brand New", description: "128GB storage" },
    { name: "Infinix Note 12", measurement: "Brand New", description: "128GB storage" },
    { name: "Samsung Tab S9", measurement: "Brand New", description: "256GB storage" }
  ],
  "Laptops" => [
    { name: "MacBook Pro M2", measurement: "Brand New", description: "14-inch, 16GB RAM" },
    { name: "MacBook Air M2", measurement: "Used", description: "13-inch, 8GB RAM" },
    { name: "HP Pavilion 15", measurement: "Brand New", description: "Core i7, 16GB RAM" },
    { name: "Dell XPS 13", measurement: "Brand New", description: "Core i5, 8GB RAM" },
    { name: "Lenovo ThinkPad", measurement: "Used", description: "X1 Carbon, 16GB RAM" }
  ],
  "Electronics" => [
    { name: "LG 55\" TV", measurement: "Brand New", description: "4K Smart TV" },
    { name: "Samsung 43\" TV", measurement: "Brand New", description: "4K Smart TV" },
    { name: "PS5", measurement: "Brand New", description: "Digital Edition" },
    { name: "Xbox Series X", measurement: "Brand New", description: "1TB storage" }
  ],
  "Vehicles" => [
    { name: "Toyota Corolla 2020", measurement: "Used", description: "1.8L Automatic" },
    { name: "Honda Civic 2019", measurement: "Used", description: "1.5L Turbo" },
    { name: "Hyundai Tucson 2021", measurement: "Used", description: "2.0L SUV" },
    { name: "Toyota Camry 2022", measurement: "Brand New", description: "2.5L Automatic" }
  ],
  "Building & Construction" => [
    { name: "Cement", measurement: "bag", description: "GHACEM cement 50kg" },
    { name: "Iron Rods", measurement: "piece", description: "16mm iron rods" },
    { name: "Roofing Sheets", measurement: "piece", description: "Aluminium sheets" },
    { name: "Tiles", measurement: "box", description: "60x60 floor tiles" },
    { name: "PVC Pipes", measurement: "length", description: "4-inch diameter" },
    { name: "Paint", measurement: "gallon", description: "Coral paint" }
  ]
}

items_data.each do |category_name, items|
  category = Category.find_by(name: category_name)
  items.each do |item|
    Item.create!(
      name: item[:name],
      slug: item[:name].parameterize,
      description: item[:description],
      measurement: item[:measurement],
      category: category
    )
  end
end

# Seed Markets
puts "Creating markets..."
markets = [
  { name: "Makola Market", location: "Central Accra", market_type: "Market" },
  { name: "Kaneshie Market", location: "Kaneshie, Accra", market_type: "Market" },
  { name: "Mallam Atta Market", location: "New Town, Accra", market_type: "Market" },
  { name: "Agbogbloshie Market", location: "Accra", market_type: "Market" },
  { name: "Jiji Ghana", location: "Online", market_type: "Online" },
  { name: "Tonaton", location: "Online", market_type: "Online" },
  { name: "Game", location: "Accra Mall", market_type: "Store" },
  { name: "Melcom Plus", location: "North Kaneshie", market_type: "Store" }
]

markets.each do |market|
  Market.create!(
    name: market[:name],
    slug: market[:name].parameterize,
    location: market[:location],
    market_type: market[:market_type]
  )
end


# Modified price seeding logic
puts "Creating price records..."
start_date = 15.months.ago.to_date
end_date = Date.today

# Define which categories are sold in which market types
MARKET_CATEGORY_MAPPING = {
  "Market" => [ "Fruits and Vegetables", "Provisions", "Building & Construction" ],
  "Store" => [ "Provisions", "Electronics", "Phones & Tablets", "Laptops", "Building & Construction" ],
  "Online" => [ "Electronics", "Phones & Tablets", "Laptops", "Vehicles", "Property" ]
}

# Create price records with more realistic patterns
Item.all.each do |item|
  base_price = case item.category.name
  when "Fruits and Vegetables" then rand(5.0..20.0)
  when "Provisions" then rand(20.0..100.0)
  when "Phones & Tablets" then rand(1000.0..8000.0)
  when "Laptops" then rand(3000.0..12000.0)
  when "Electronics" then rand(1500.0..5000.0)
  when "Vehicles" then rand(50000.0..200000.0)
  when "Building & Construction" then rand(50.0..200.0)
  else rand(100.0..1000.0)
  end

  # Select relevant markets for this item
  relevant_markets = Market.all.select do |market|
    MARKET_CATEGORY_MAPPING[market.market_type].include?(item.category.name)
  end

  relevant_markets.each do |market|
    # Create only 5 price points over 15 months instead of monthly
    sample_dates = (start_date..end_date).select { |d| d.day == 1 }
                                        .sample(5)
                                        .sort

    sample_dates.each do |date|
      seasonal_factor = case date.month
      when 12 then 1.2  # Christmas season
      when 1 then 1.15  # New Year
      when 6 then 0.9   # Mid-year sales
      when 7 then 0.85  # More sales
      else 1.0
      end

      market_factor = case market.market_type
      when "Store" then 1.15    # Higher prices in stores
      when "Online" then 0.95   # Competitive online prices
      else 1.0
      end

      # Add some randomness to make prices more realistic
      variation = rand(0.95..1.05)

      # Skip some price entries randomly to make data more sparse
      next if rand < 0.2 # 20% chance to skip

      Price.create!(
        item: item,
        market: market,
        price: (base_price * seasonal_factor * market_factor * variation).round(2),
        date_recorded: date
      )
    end
  end
end

# Create test users
puts "Creating users..."
users = [
  { email: "admin@cedipower.com", password: "password123", role: "admin", name: "System Admin" },
  { email: "makola@cedipower.com", password: "password123", role: "store_owner", name: "Makola Market Manager" },
  { email: "melcom@cedipower.com", password: "password123", role: "store_owner", name: "Melcom Store Manager" },
  { email: "user@cedipower.com", password: "password123", role: "general_user", name: "John Mensah" }
]

users.each do |user|
  User.create!(
    email: user[:email],
    password: user[:password],
    role: user[:role],
    name: user[:name]
  )
end

puts "\nSeeding completed!"
puts "Created:"
puts "- #{Category.count} categories"
puts "- #{Item.count} items"
puts "- #{Market.count} markets"
puts "- #{Price.count} price records"
puts "- #{User.count} users"
