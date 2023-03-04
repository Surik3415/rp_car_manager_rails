# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe CarsController, type: :controller do
  describe 'GET #index' do
    let(:car1) do
      create(:car, make: 'Audi', model: 'R8',
                   year: 2021, price: 120_000,
                   date_added: '8/10/21', car_id: '12fasfc12r12d2rt',
                   odometer: 13_000, description: 'The good car')
    end

    let(:car2) do
      create(:car, make: 'Toyota', model: 'Corolla',
                   year: 2018, price: 15_000,
                   date_added: '1/11/21', car_id: '63wegds53qwqe2rt',
                   odometer: 130_000, description: 'The car ')
    end

    context 'when no search params are given' do
      it 'assigns all cars as @cars' do
        get :index
        expect(assigns(:cars)).to eq([car1, car2])
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context 'when search params are given' do
      it 'filters the cars by make' do
        get :index, params: { make: 'Audi' }
        expect(assigns(:cars)).to eq([car1])
      end

      it 'filters the cars by model' do
        get :index, params: { model: 'Corolla' }
        expect(assigns(:cars)).to eq([car2])
      end

      it 'filters the cars by year range' do
        get :index, params: { year_from: 2019, year_to: 2022 }
        expect(assigns(:cars)).to eq([car1])
      end

      it 'filters the cars by price range' do
        get :index, params: { price_from: 10_000, price_to: 20_000 }
        expect(assigns(:cars)).to eq([car2])
      end

      it 'sorts the cars by price in ascending order' do
        get :index, params: { sort: 'price', direction: 'asc' }
        expect(assigns(:cars)).to eq([car2, car1])
      end

      it 'sorts the cars by price in descending order' do
        get :index, params: { sort: 'price', direction: 'desc' }
        expect(assigns(:cars)).to eq([car1, car2])
      end

      it 'paginates the cars' do
        20.times { create(:car) }
        get :index
        expect(assigns(:pagy).items).to eq(6)
      end
    end
    DatabaseCleaner.clean
  end

  describe 'GET #help' do
    it 'renders the index template' do
      get :help
      expect(response).to render_template(:help)
    end
  end
end
# rubocop:enable Metrics/BlockLength
