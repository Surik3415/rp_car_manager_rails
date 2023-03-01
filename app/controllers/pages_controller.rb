# frozen_string_literal: true

# controller for root page
class PagesController < ApplicationController
  def index
    render 'pages/index'
  end
end
