# frozen_string_literal: true

# module application helper
module ApplicationHelper
  include Pagy::Frontend

  def currently_at
    render partial: 'shared/menu'
  end
end
