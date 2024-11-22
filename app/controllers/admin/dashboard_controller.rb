class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def index
    @users = policy_scope(User)
    @categories = policy_scope(Category)
    @items = policy_scope(Item)
    @markets = policy_scope(Market)
  end

  private

  def authorize_admin
    redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
  end
end
