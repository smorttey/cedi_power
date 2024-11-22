class ApplicationController < ActionController::Base
  include Pundit
  include ActionView::Helpers::AssetUrlHelper
  include MetaTags::ViewHelper

  before_action :prepare_meta_tags
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Modified Pundit callbacks to handle Devise controllers
  after_action :verify_authorized, unless: :skip_pundit_check?
  after_action :verify_policy_scoped, if: :need_policy_scope?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def skip_pundit_check?
    devise_controller? || 
    action_name == 'index'
  end

  def need_policy_scope?
    !devise_controller? && 
    action_name == 'index'
  end

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

  def user_not_authorized
    redirect_to root_path, alert: "You are not authorized to perform this action."
  end

  # Allow modern browsers only
  # allow_browser versions: :modern

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
