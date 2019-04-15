require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit the homepage' do
    it "I see 'Hello World!'" do
      visit '/'

      expect(page).to have_content("Hello World!")
    end
  end
end
