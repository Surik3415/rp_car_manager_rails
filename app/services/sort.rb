# frozen_string_literal: true

# module for sorting
module Sort
  def sort
    sort_by_prise
    sort_by_date_added
  end

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
end
