# frozen_string_literal: true

require_relative '../services/filter'
require_relative '../services/sort'

# controller for cars
class CarsController < ApplicationController
  include Sort
  include Filter
  
  def index
    @cars = Car.all
    filter
    @pagy, @cars = pagy(@cars)
    sort
  end

  def help; end

  private

  def search_params
    params.require(:search_request).permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end
end
