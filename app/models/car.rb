# frozen_string_literal: true

# car model
class Car < ApplicationRecord
  include Filterable
  
  validates :make, presence: true
  validates :model, presence: true
  validates :year, numericality: { only_integer: true }
  validates :price, numericality: { only_integer: true }

  scope :filter_by_make, ->(make) { where make: make.capitalize }
  scope :filter_by_model, ->(model) { where model: model.capitalize }

  scope :filter_by_year_from, ->(year_from) { where year: year_from.to_i..9999 }
  scope :filter_by_year_to, ->(year_to) { where year: (0..year_to.to_i) }

  scope :filter_by_price_from, ->(price_from) { where price: (price_from.to_i..999_999) }
  scope :filter_by_price_to, ->(price_to) { where price: (0..price_to.to_i) }
end
