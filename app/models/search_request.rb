# frozen_string_literal: true

# search request model
class SearchRequest < ApplicationRecord
  belongs_to :user, optional: true

  validates :make, presence: true, allow_blank: true
  validates :model, presence: true, allow_blank: true
  validates :price_from, numericality: { only_integer: true }, allow_blank: true
  validates :price_to, numericality: { only_integer: true }, allow_blank: true
  validates :year_from, numericality: { only_integer: true }, allow_blank: true
  validates :year_to, numericality: { only_integer: true }, allow_blank: true
end
