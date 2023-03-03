# frozen_string_literal: true

# module Query
module Query
  attr_reader :cars

  # class for filter
  class Filter
    def initialize(cars, params)
      @cars = cars
      @params = params
    end

    def call
      filter_by_make_and_model(@params)
      filter_by_year_and_price(@params)
      @cars
    end

    private

    def filter_by_make_and_model(params)
      @cars = @cars.where('LOWER(make) LIKE ?', params[:make].downcase) if params[:make].present?
      @cars = @cars.where('LOWER(model) LIKE ?', params[:model].downcase) if params[:model].present?
    end

    # rubocop:disable Metrics/AbcSize
    def filter_by_year_and_price(params)
      @relative_values = %w[year price]
      @relative_values.each do |v|
        if params[:"#{v}_from"].present? && params[:"#{v}_to"].present?
          @cars = @cars.where("#{v}": params[:"#{v}_from"]..params[:"#{v}_to"])
        elsif params[:"#{v}_from"].present?
          @cars = @cars.where("#{v} >= :#{v}_from", "#{v}_from": params[:"#{v}_from"])
        elsif params[:"#{v}_to"].present?
          @cars = @cars.where("#{v} <= :#{v}_to", "#{v}_to": params[:"#{v}_to"])
        end
      end
    end
    # rubocop:enable Metrics/AbcSize
  end
end