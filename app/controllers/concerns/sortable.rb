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
      direction = sort_params[:direction] || 'asc'
      case sort_params[:sort_by]
      when 'date_added'
        order(date_added: direction)
      when 'price'
        order(price: direction)
      else
        order(date_added: :asc)
      end
    end
  end
end
