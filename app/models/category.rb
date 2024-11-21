class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :items, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
