class Category < ApplicationRecord
    has_many :items, dependent: :destroy
  
    validates :name, presence: true, uniqueness: true
  
    before_save :generate_slug
  
    private
  
    def generate_slug
      self.slug = name.parameterize if name_changed?
    end
  end
  