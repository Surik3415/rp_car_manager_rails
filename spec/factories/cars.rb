# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    make { FFaker::Vehicle::make }
    model { FFaker::Vehicle::model }
    year { FFaker::Vehicle::year }
    price {  rand(10_000..100_000) }
    date_added { '18/09/21' }
    car_id { FFaker::Vehicle::vin }
    odometer { rand(10_000..200_000) }
    description { FFaker::LoremPL::sentence }
  end
end
