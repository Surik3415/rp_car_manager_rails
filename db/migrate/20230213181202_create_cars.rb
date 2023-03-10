# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :car_id, null: false
      t.string :make, null: false
      t.string :model, null: false
      t.integer :year, null: false
      t.integer :odometer, null: false
      t.integer :price, null: false
      t.string :description, null: false
      t.string :date_added, null: false

      t.timestamps
    end
  end
end
