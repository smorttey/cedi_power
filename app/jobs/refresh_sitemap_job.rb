class RefreshSitemapJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.info "Starting sitemap refresh..."
    
    # Set the host based on environment
    SitemapGenerator::Sitemap.default_host = if Rails.env.production?
      "https://cedipower.com.gh"
    else
      "http://localhost:3000"
    end
    
    # Set other necessary configurations
    SitemapGenerator::Sitemap.public_path = Rails.public_path
    SitemapGenerator::Sitemap.adapter = SitemapGenerator::FileAdapter.new
    SitemapGenerator::Sitemap.create_index = true
    SitemapGenerator::Sitemap.compress = false
    
    # Create the sitemap
    SitemapGenerator::Sitemap.verbose = true
    SitemapGenerator::Sitemap.create do
      # Add static pages to main sitemap
      add '/', changefreq: 'daily', priority: 1.0

      # Categories sitemap
      group(filename: :categories, sitemaps_path: 'sitemaps/') do
        Category.find_each do |category|
          add category_path(category), 
              lastmod: category.updated_at,
              changefreq: 'weekly',
              priority: 0.8
        end
      end

      # Items sitemap
      group(filename: :items, sitemaps_path: 'sitemaps/') do
        Item.find_each do |item|
          add item_path(item), 
              lastmod: item.updated_at,
              changefreq: 'daily',
              priority: 0.9
        end
      end

      # Markets sitemap
      group(filename: :markets, sitemaps_path: 'sitemaps/') do
        Market.find_each do |market|
          add market_path(market), 
              lastmod: market.updated_at,
              changefreq: 'weekly',
              priority: 0.7
        end
      end
    end

    Rails.logger.info "Sitemap refresh completed"
  end
end 