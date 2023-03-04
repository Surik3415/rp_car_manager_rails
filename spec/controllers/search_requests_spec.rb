# frozen_string_literal: true

require 'rails_helper'
require 'devise'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

# rubocop:disable Metrics/BlockLength
RSpec.describe SearchRequestsController, type: :controller do
  let(:pablito) { create(:user, email: 'ivobobul@gmail.com', password: 'asdaw12f') }

  describe 'GET #index' do
    context 'when user is logged in' do
      it 'returns a success response' do
        sign_in pablito
        get :index
        expect(response).to be_successful
      end

      it 'assigns all search requests as @search_requests' do
        sign_in pablito
        get :index
        expect(assigns(:search_requests)).to eq(SearchRequest.where(user_id: pablito.id))
      end
    end

    context 'when user is not logged in' do
      before { get :index }

      it 'redirects to the login page' do
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'displays a flash message' do
        expect(flash[:alert]).to eq('Please log in to see your search story')
      end
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'assigns a new search request as @search_request' do
      expect(assigns(:search_request)).to be_a_new(SearchRequest)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { search_request: attributes_for(:search_request) } }

      before do
        sign_in create(:user)
        post :create, params: valid_params
      end

      it 'creates a new search request' do
        expect(SearchRequest.count).to eq(1)
      end

      it 'assigns a newly created search request as @search_request' do
        expect(assigns(:search_request)).to be_a(SearchRequest)
        expect(assigns(:search_request)).to be_persisted
      end

      it 'redirects to the cars path with search request parameters' do
        expect(response).to redirect_to(cars_path(valid_params[:search_request]))
      end
    end
  end
  DatabaseCleaner.clean
end
# rubocop:enable Metrics/BlockLength
