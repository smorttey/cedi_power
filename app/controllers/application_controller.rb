class ApplicationController < ActionController::Base
  include Pundit
  include ActionView::Helpers::AssetUrlHelper
  include MetaTags::ViewHelper

  before_action :prepare_meta_tags

  # Enforce Pundit policies globally
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # Rescue from Pundit errors
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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

  # Rescue from unauthorized access
  def user_not_authorized
    redirect_to root_path, alert: "You are not authorized to perform this action."
  end

  # Allow modern browsers only
  allow_browser versions: :modern
end
