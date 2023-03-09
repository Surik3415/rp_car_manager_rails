# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@email.com" }
    password { 'sasdq242d' }
  end
end
