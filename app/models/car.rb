# frozen_string_literal: true

# car model
class Car < ApplicationRecord
  validates :make, presence: true
  validates :model, presence: true
  validates :year_from, numericality: { only_integer: true }
  validates :price, numericality: { only_integer: true }
end
