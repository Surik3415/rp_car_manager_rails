# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car, driver: :selenium_chrome, js: true do
 

  describe 'open car page' do
    let!(:car) { create(:car) }
    it 'should open car page and cklick button' do
      visit '/cars'

      sleep 5

      click_link 'Date added (Oldest to Newest)'

      sleep 5
      expect(page).to have_content 'My searches page'
    end
  end
end
