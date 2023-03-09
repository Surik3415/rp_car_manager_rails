# frozen_string_literal: true

# require_relative '../query/sort'

# controller for cars
class CarsController < ApplicationController
  # include Query

  def index
    @cars = Car.filter(filter_params).sort_it(sort_params)
    @pagy, @cars = pagy(@cars)
    # sorter = Query::Sort.new(@cars, params)
    # @cars = sorter.call
  end

  def help; end

  private

  def filter_params
    params.slice(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end

  def sort_params
    params.slice(:price_direction, :date_added_direction)
  end
end
