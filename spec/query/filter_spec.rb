# frozen_string_literal: true

require 'rails_helper'
require_relative '../../app/controllers/cars_controller'

# rubocop:disable Metrics/BlockLength
RSpec.describe Query::Filter do
  describe '#call' do
    let!(:car1) { create(:car, make: 'Toyota', model: 'Camry', year: 2019, price: 20_000) }
    let!(:car2) { create(:car, make: 'Honda', model: 'Civic', year: 2020, price: 25_000) }
    let!(:car3) { create(:car, make: 'Toyota', model: 'Corolla', year: 2021, price: 30_000) }
    let(:filter) { described_class.new(Car.all, params) }
    let(:result) { filter.call }

    context 'with no params' do
      let(:params) { {} }
      it 'no params' do
        expect(result).to contain_exactly(car1, car2, car3)
      end
    end

    context 'when make filter is applied' do
      let(:params) { { make: 'Toyota' } }

      it 'make' do
        expect(result).to contain_exactly(car1, car3)
      end
    end

    context 'when model filter is applied' do
      let(:params) { { model: 'Civic' } }

      it 'model' do
        expect(result).to contain_exactly(car2)
      end
    end

    context 'when year filter is applied' do
      let(:params) { { year_from: 2020, year_to: 2021 } }

      it 'year' do
        expect(result).to contain_exactly(car2, car3)
      end
    end

    context 'when price filter is applied' do
      let(:params) { { price_from: 25_000, price_to: 30_000 } }

      it 'price' do
        expect(result).to contain_exactly(car2, car3)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
