# frozen_string_literal: true

# car model
class Car < ApplicationRecord
  validates :make, presence: true
  validates :model, presence: true
  validates :year, numericality: { only_integer: true }
  validates :price, numericality: { only_integer: true }

  scope :filter_by_make, -> (make) { where make: make.capitalize }
  scope :filter_by_model, -> (model) { where model: model.capitalize }

end
