# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    make { 'Ford' }
    model { 'Mustang' }
    year { 2021 }
    price { 20_000 }
    date_added { '8/10/21' }
    car_id { '12fasfh22r16d2rh' }
    odometer { 130_000 }
    description { 'The car' }
  end
end
