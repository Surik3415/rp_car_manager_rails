# frozen_string_literal: true

class AddUserIdToSearchRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :search_requests, :user, null: true, foreign_key: true
  end
end
