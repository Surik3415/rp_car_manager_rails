# frozen_string_literal: true

require_relative '../query/filter'
require_relative '../query/sort'

# controller for cars
class CarsController < ApplicationController
  include Query

  def index
    @cars = Car.all
    filter = Query::Filter.new(@cars, params)
    @cars = filter.call
    @pagy, @cars = pagy(@cars)
    sorter = Query::Sort.new(@cars, params)
    @cars = sorter.call
  end

  def help; end
end
