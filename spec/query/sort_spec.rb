# frozen_string_literal: true

require 'rails_helper'


# RSpec.describe Query::Sort do
#   describe '#call' do
#     let!(:car1) { create(:car, make: 'Toyota', model: 'Camry', year: 2019, price: 20_000, date_added: '01/01/2021') }
#     let!(:car2) { create(:car, make: 'Honda', model: 'Civic', year: 2020, price: 25_000, date_added: '01/02/2021') }
#     let!(:car3) { create(:car, make: 'Toyota', model: 'Corolla', year: 2021, price: 30_000, date_added: '01/03/2021') }

#     context 'with no params' do
#       it 'returns cars sorted by date_added ascending' do
#         filter = described_class.new(Car.all, {})
#         expect(filter.call).to eq([car1, car2, car3])
#       end
#     end

#     context 'with params for sorting by price ascending' do
#       it 'returns cars sorted by price ascending' do
#         filter = described_class.new(Car.all, { sort: 'price', direction: 'asc' })
#         expect(filter.call).to eq([car1, car2, car3])
#       end
#     end

#     context 'with params for sorting by price descending' do
#       it 'returns cars sorted by price descending' do
#         filter = described_class.new(Car.all, { sort: 'price', direction: 'desc' })
#         expect(filter.call).to eq([car3, car2, car1])
#       end
#     end

#     context 'with params for sorting by date_added ascending' do
#       it 'returns cars sorted by date_added ascending' do
#         filter = described_class.new(Car.all, { sort: 'date_added', direction: 'asc' })
#         expect(filter.call).to eq([car1, car2, car3])
#       end
#     end

#     context 'with params for sorting by date_added descending' do
#       it 'returns cars sorted by date_added descending' do
#         filter = described_class.new(Car.all, { sort: 'date_added', direction: 'desc' })
#         expect(filter.call).to eq([car3, car2, car1])
#       end
#     end
#   end
# end
