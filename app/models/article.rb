class Article < ApplicationRecord
  enum risk: {
    negligible: 'negligible',
    low: 'low',
    medium: 'medium',
    high: 'high'
  }, _suffix: true

  validates :name, presence: true, uniqueness: true
end
