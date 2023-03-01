# frozen_string_literal: true

FactoryBot.define do
  factory :search_request do
    make { 'Ford' }
    model { 'Mustang' }
    year_from { 2015 }
    year_to { 2019 }
    price_from { 10_000 }
    price_to { 120_000 }
  end
end
