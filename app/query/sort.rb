# frozen_string_literal: true

# module Query
module Query
  # class for sorting
  class Sort
    attr_reader :cars

    def initialize(cars, params = {})
      @cars = cars
      @params = params
    end

    def call
      sort_by_prise(@params)
      sort_by_date_added(@params)
      @cars
    end

    private

    def sort_by_prise(params)
      return unless params[:sort] == 'price'

      @cars = @cars.order(price: params[:direction])
    end

    def sort_by_date_added(params)
      return unless params[:sort] == 'date_added'

      direction = params[:direction] == 'desc' ? 'desc' : 'asc'
      @cars = @cars.sort_by { |car| Date.strptime(car.date_added, '%d/%m/%Y') }
      @cars.reverse! if direction == 'desc'
    end
  end
end
