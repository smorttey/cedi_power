class Price < ApplicationRecord
  belongs_to :item
  belongs_to :market

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :date_recorded, presence: true

  # Add a scope for price history
  def self.price_history
    all.group_by { |price| price.date_recorded.beginning_of_month }
       .transform_values { |prices| 
         {
           average: (prices.sum(&:price) / prices.size).round(2),
           count: prices.size
         }
       }
       .sort_by { |date, _| date }
       .map { |date, data| [date, data[:average]] }
       .to_h
  end
end
