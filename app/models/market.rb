class Market < ApplicationRecord
    has_many :prices, dependent: :destroy
  
    validates :name, presence: true, uniqueness: true
    validates :location, presence: true
  
    before_save :generate_slug
  
    private
  
    def generate_slug
      self.slug = name.parameterize if name_changed?
    end
  end
  