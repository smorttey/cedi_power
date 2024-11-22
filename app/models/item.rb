class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :category
  has_many :prices, dependent: :destroy
  has_many :saved_items, dependent: :destroy

  validates :name, presence: true
  validates :measurement, presence: true

  private

  def slug_candidates
    if ["Phones & Tablets", "Laptops", "Electronics", "Vehicles"].include?(category&.name)
      [
        [:name, :measurement],
        [:name, :measurement, :id]
      ]
    else
      [
        :name,
        [:name, :id]
      ]
    end
  end

  def should_generate_new_friendly_id?
    name_changed? || measurement_changed? || super
  end
end
