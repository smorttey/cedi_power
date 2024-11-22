module ApplicationHelper
  include Chartkick::Helper

  def chartkick_helper
    javascript_include_tag "chartkick", "Chart.bundle"
  end
end
