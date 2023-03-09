# frozen_string_literal: true

# frozen_string_literal

# Filterable
module Filterable
  extend ActiveSupport::Concern

  included do
    scope :filter_by_make, ->(make) { where('make ILIKE ?', make) }
    scope :filter_by_model, ->(model) { where('model ILIKE ?', model) }

    scope :filter_by_year_from, ->(year_from) { where year: year_from.to_i..Float::INFINITY }
    scope :filter_by_year_to, ->(year_to) { where year: (0..year_to.to_i) }

    scope :filter_by_price_from, ->(price_from) { where price: (price_from.to_i..Float::INFINITY) }
    scope :filter_by_price_to, ->(price_to) { where price: (0..price_to.to_i) }
  end

  # ClassMethods
  module ClassMethods
    def filter(filtering_params)
      results = where(nil)
      filtering_params.each do |key, value|
        results = results.public_send("filter_by_#{key}", value) if value.present?
      end
      results
    end
  end
end
