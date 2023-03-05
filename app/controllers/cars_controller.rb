# frozen_string_literal: true

require_relative '../query/sort'

# controller for cars
class CarsController < ApplicationController
  include Query

  def index
    @cars = Car.where(nil)
    filtering_params(params).each do |key, value|
      @cars = @cars.send("filter_by_#{key}", value) if value.present?
    end
    @pagy, @cars = pagy(@cars)
    sorter = Query::Sort.new(@cars, params)
    @cars = sorter.call
  end

  def help; end

  private

  # A list of the param names that can be used for filtering the Car list
  def filtering_params(params)
    params.slice(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end
end
