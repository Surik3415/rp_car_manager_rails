# frozen_string_literal: true

# controller for search requests
class SearchRequestsController < ApplicationController
  def index
    if user_signed_in?
      @search_requests = SearchRequest.all
    else
      redirect_to new_user_session_path
      flash[:alert] = 'Please log in to see your search story'
    end
  end

  def new
    @search_request = SearchRequest.new
  end

  def create
    @search_request = SearchRequest.new(search_request_params)
    @search_request.user = current_user if user_signed_in?

    if @search_request.save
      redirect_to cars_path(search_request_params)
    else
      render :new
    end
  end

  private

  def search_request_params
    params.require(:search_request).permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end
end
