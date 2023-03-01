# frozen_string_literal: true

# controller for cars
class CarsController < ApplicationController
  # GET /cars or /cars.json
  def index
    @cars = Car.all
    filter
    @pagy, @cars = pagy(@cars)
    sort
  end

  def help; end

  def filter
    filter_by_make_and_model
    filter_by_year_and_price
  end

  def sort
    sort_by_prise
    sort_by_date_added
  end

  private

  def filter_by_make_and_model
    @cars = @cars.where('LOWER(make) LIKE ?', params[:make].downcase) if params[:make].present?
    @cars = @cars.where('LOWER(model) LIKE ?', params[:model].downcase) if params[:model].present?
  end

  # rubocop:disable Metrics/AbcSize
  def filter_by_year_and_price
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

  def sort_by_prise
    return unless params[:sort] == 'price'

    @cars = @cars.order(price: params[:direction])
  end

  def sort_by_date_added
    return unless params[:sort] == 'date_added'

    direction = params[:direction] == 'desc' ? 'desc' : 'asc'
    @cars = @cars.sort_by { |car| Date.strptime(car.date_added, '%d/%m/%Y') }
    @cars.reverse! if direction == 'desc'
  end

  def search_params
    params.require(:search_request).permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end
end
