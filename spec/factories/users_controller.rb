# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'mailbox@mail.com' }
    password { 'sasdq242d' }
  end
end
