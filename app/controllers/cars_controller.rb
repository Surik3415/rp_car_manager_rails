# frozen_string_literal: true


# controller for cars
class CarsController < ApplicationController

  def index
    @cars = Car.filter(filter_params).sort_it(sort_params)
    @pagy, @cars = pagy(@cars)
  end

  def help; end

  private

  def filter_params
    params.slice(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end

  def sort_params
    params.slice(:direction, :sort_by)
  end
end
