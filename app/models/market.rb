class Market < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :owner, class_name: 'User'
  has_many :prices, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
end
