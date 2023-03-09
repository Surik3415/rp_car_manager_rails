# frozen_string_literal

# Filterable
module Sortable
  extend ActiveSupport::Concern

  included do
    scope :sort_by_date_added, lambda { |date_added_direction, price_direction|
      order(
        price: price_direction || :asc,
        date_added: date_added_direction || :asc
      )
    }

    # scope :sort_by_price_direction, ->(price_direction) { order price: price_direction }
  end

  # ClassMethods
  module ClassMethods
    def sort_it(sort_params)
      results = where(nil)
      if sort_params[:date_added_direction].present? || sort_params[:price_direction]
        results = results.send(:sort_by_date_added, sort_params[:date_added_direction], sort_params[:price_direction])
      end
      results
    end
  end
end
