class ApplicationController < ActionController::Base
  before_action :prepare_meta_tags

  private

  def prepare_meta_tags(options = {})
    site_name = "Cedi Power"
    title = options[:title] || "Find out the Current Prices of Goods in Ghana"
    description = options[:description] || "Discover price trends for items in Ghana's major markets and stores like Makola, Melcom, and Kejetia."
    keywords = options[:keywords] || %w[Ghana markets prices items Makola Kejetia Melcom Cedi]
    image = options[:image] || asset_path("default-image.png")

    set_meta_tags(
      site: site_name,
      title: title,
      reverse: true,
      description: description,
      keywords: keywords,
      canonical: request.original_url,
      og: {
        site_name: site_name,
        title: title,
        description: description,
        type: 'website',
        url: request.original_url,
        image: image
      },
      twitter: {
        card: 'summary_large_image',
        site: '@cedipower',
        title: title,
        description: description,
        image: image
      }
    )
  end
  class ApplicationController < ActionController::Base
  before_action :prepare_meta_tags

  private

  def prepare_meta_tags(options = {})
    site_name = "Cedi Power"
    title = options[:title] || "Track Ghana Market Prices"
    description = options[:description] || "Discover price trends for items in Ghana's major markets like Makola and Kejetia."
    keywords = options[:keywords] || %w[Ghana markets prices items Makola Kejetia]
    image = options[:image] || asset_path("default-image.png")

    set_meta_tags(
      site: site_name,
      title: title,
      reverse: true,
      description: description,
      keywords: keywords,
      canonical: request.original_url,
      og: {
        site_name: site_name,
        title: title,
        description: description,
        type: 'website',
        url: request.original_url,
        image: image
      },
      twitter: {
        card: 'summary_large_image',
        site: '@cedipower',
        title: title,
        description: description,
        image: image
      }
    )
  end
end

# Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
allow_browser versions: :modern

end
