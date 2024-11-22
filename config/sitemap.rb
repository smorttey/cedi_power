SitemapGenerator::Sitemap.default_host = "http://localhost:3000" if Rails.env.development?
SitemapGenerator::Sitemap.default_host = "https://cedipower.com.gh" if Rails.env.production?

# Set the correct public path
SitemapGenerator::Sitemap.public_path = Rails.public_path

# Set sitemap storage adapter
SitemapGenerator::Sitemap.adapter = SitemapGenerator::FileAdapter.new

# Enable sitemap index
SitemapGenerator::Sitemap.create_index = true

# Generate both compressed and uncompressed versions
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  # Add static pages to main sitemap
  add "/", changefreq: "daily", priority: 1.0

  # Categories sitemap
  group(filename: :categories, sitemaps_path: "sitemaps/") do
    Category.find_each do |category|
      add category_path(category),
          lastmod: category.updated_at,
          changefreq: "weekly",
          priority: 0.8
    end
  end

  # Items sitemap
  group(filename: :items, sitemaps_path: "sitemaps/") do
    Item.find_each do |item|
      add item_path(item),
          lastmod: item.updated_at,
          changefreq: "daily",
          priority: 0.9
    end
  end

  # Markets sitemap
  group(filename: :markets, sitemaps_path: "sitemaps/") do
    Market.find_each do |market|
      add market_path(market),
          lastmod: market.updated_at,
          changefreq: "weekly",
          priority: 0.7
    end
  end

  # Prices sitemap
  group(filename: :prices, sitemaps_path: "sitemaps/") do
    Price.find_each do |price|
      add market_prices_path(price.market),
          lastmod: price.updated_at,
          changefreq: "daily",
          priority: 0.6
    end
  end
end
