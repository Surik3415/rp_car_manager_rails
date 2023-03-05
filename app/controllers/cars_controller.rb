# frozen_string_literal: true

require_relative '../query/sort'

# controller for cars
class CarsController < ApplicationController
  include Query

  def index
    @cars = Car.where(nil)
    @cars = Car.filter(params.slice(:make, :model, :year_from, :year_to, :price_from, :price_to))
    @pagy, @cars = pagy(@cars)
    sorter = Query::Sort.new(@cars, params)
    @cars = sorter.call
  end

  def help; end
end
