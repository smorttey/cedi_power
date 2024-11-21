class Item < ApplicationRecord
  belongs_to :category
  has_many :prices, dependent: :destroy
  has_many :saved_items, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :measurement, presence: true

  before_save :generate_slug

  private

  def generate_slug
    self.slug = name.parameterize if name_changed?
  end
end
