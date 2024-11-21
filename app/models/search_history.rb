class SearchHistory < ApplicationRecord
  belongs_to :user, optional: true

  validates :search_term, presence: true
end
