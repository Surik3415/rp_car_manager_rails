# frozen_string_literal: true

# car model
class Car < ApplicationRecord
  validates :make, presence: true
  validates :model, presence: true
  validates :year, numericality: { only_integer: true }
  validates :price, numericality: { only_integer: true }

  scope :filter_by_make, -> (make) { where make: make.capitalize }
  scope :filter_by_model, -> (model) { where model: model.capitalize }

  scope :filter_by_year_from, -> (year_from) { where year: year_from..year }
  scope :filter_by_year_to, -> (year_to) { where year: year..year_to }

  scope :filter_by_price_from, -> (price_from) { where price: price_from..price }
  scope :filter_by_price_to, -> (price_to) { where price: price..price_to }

end
