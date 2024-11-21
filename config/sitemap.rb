SitemapGenerator::Sitemap.default_host = "http://localhost:3000" if Rails.env.development?
SitemapGenerator::Sitemap.default_host = "https://cedipower.com.gh" if Rails.env.production?

# Set the correct public path
SitemapGenerator::Sitemap.public_path = Rails.public_path

# Set sitemap storage adapter
SitemapGenerator::Sitemap.adapter = SitemapGenerator::FileAdapter.new

# Generate both compressed and uncompressed versions
SitemapGenerator::Sitemap.compress = false

# Notify search engines of updates
# SitemapGenerator::Sitemap.ping_search_engines = Rails.env.production?

SitemapGenerator::Sitemap.create do
  # Add categories
  Category.find_each do |category|
    add category_path(category), lastmod: category.updated_at
  end

  # Add items
  Item.find_each do |item|
    add item_path(item), lastmod: item.updated_at
  end

  # Add markets
  Market.find_each do |market|
    add market_path(market), lastmod: market.updated_at
  end

  # Add prices (optional if indexed through items/markets)
  Price.find_each do |price|
    add market_prices_path(price.market), lastmod: price.updated_at
  end
end

# Create a compressed version as well
SitemapGenerator::Sitemap.create_index = true
