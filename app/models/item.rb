class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category
  has_many :prices, dependent: :destroy
  has_many :saved_items, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :measurement, presence: true
end
