# frozen_string_literal

# Filterable
module Sortable
  extend ActiveSupport::Concern

  included do
  end

  # ClassMethods
  module ClassMethods
    def sort_it(sort_params)
      direction = sort_params[:direction] || 'asc'
      case sort_params[:sort_by]
      when 'date_added'
        order(Arel.sql("to_date(date_added, 'DD/MM/YY') #{direction}"))
      when 'price'
        order(price: direction)
      else
        order(date_added: :asc)
      end
    end
  end
end
