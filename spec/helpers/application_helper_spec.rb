# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#currently_at' do
    it 'renders the shared/menu partial' do
      expect(helper).to receive(:render).with(partial: 'shared/menu')
      helper.currently_at
    end
  end
end
