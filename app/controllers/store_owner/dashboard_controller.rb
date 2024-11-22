class StoreOwner::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_store_owner

  def index
    @markets = Market.where(owner_id: current_user.id)
    @prices = Price.where(market: @markets)
  end

  private

  def authorize_store_owner
    redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.store_owner?
  end
end
