module ApplicationHelper
  include Chartkick::Helper

  def chartkick_helper
    javascript_include_tag "chartkick", "Chart.bundle"
  end

  def users_path
    admin_users_path if current_user&.admin?
  end
end
