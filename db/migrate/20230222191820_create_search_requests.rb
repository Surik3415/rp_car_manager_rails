# frozen_string_literal: true

class CreateSearchRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :search_requests do |t|
      t.string :make, null: true
      t.string :model, null: true
      t.integer :price_from, null: true
      t.integer :price_to, null: true
      t.integer :year_from, null: true
      t.integer :year_to, null: true

      t.timestamps
    end
  end
end
