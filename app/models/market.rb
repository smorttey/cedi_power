class Market < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :prices, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
end
