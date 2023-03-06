# frozen_string_literal: true

# car model
class Car < ApplicationRecord
  include Filterable
  
  validates :make, presence: true
  validates :model, presence: true
  validates :year, numericality: { only_integer: true }
  validates :price, numericality: { only_integer: true }

end
