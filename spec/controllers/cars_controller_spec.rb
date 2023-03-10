# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe CarsController, type: :controller do
  describe 'GET #index' do
    let!(:car1) { create(:car) }
    let!(:car2) { create(:car) }

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
  end

  context 'when the pagination applied' do
    before { get :index }
    let!(:cars) { create_list(:car, 20) }
    let!(:default_per_page) { 6 }

    it 'returns default amount of items per page' do
      expect(assigns(:pagy).items).to eq(default_per_page)
    end
  end

  describe 'GET #help' do
    it 'renders the index template' do
      get :help
      expect(response).to render_template(:help)
    end
  end
end
# rubocop:enable Metrics/BlockLength
