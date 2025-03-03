class SitemapController < ApplicationController
  skip_before_action :prepare_meta_tags

  ALLOWED_SITEMAPS = [
    "sitemap",
    "sitemaps/categories",
    "sitemaps/items",
    "sitemaps/markets",
    "sitemaps/prices"
  ].freeze

  def index
    requested_file = params[:file] || "sitemap"
    unless ALLOWED_SITEMAPS.include?(requested_file)
      return render xml: { error: "Invalid sitemap" }, status: :bad_request
    end

    sitemap_path = Rails.public_path.join("#{requested_file}.xml")
    gzipped_sitemap_path = Rails.public_path.join("#{requested_file}.xml.gz")

    Rails.logger.info "Looking for sitemap at: #{sitemap_path}"
    Rails.logger.info "Looking for gzipped sitemap at: #{gzipped_sitemap_path}"

    if request.headers["Accept-Encoding"]&.include?("gzip") && File.exist?(gzipped_sitemap_path)
      send_file(gzipped_sitemap_path,
                type: "application/xml",
                disposition: "inline",
                headers: { "Content-Encoding" => "gzip" })
    elsif File.exist?(sitemap_path)
      send_file(sitemap_path,
                type: "application/xml",
                disposition: "inline")
    else
      render xml: { error: "Sitemap not found" }, status: :not_found
    end
  end
end
