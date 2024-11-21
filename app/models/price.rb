class Price < ApplicationRecord
  belongs_to :item
  belongs_to :market

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :date_recorded, presence: true
end
