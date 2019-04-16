require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit /images' do
    before(:each) do
      visit '/images'
    end

    it "Then by default I see a list of images taken from the hubble api.", :vcr do
      expect(page).to have_css('#images')
      within "#images" do
        within first ".image" do
          expect(page).to have_css('.title')
          expect(page).to have_css('.picture')
          expect(page).to have_css('.description')
          expect(page).to have_css('.credits')
          expect(page).to have_css('.favorite-button')
        end
      end
    end
  end
end
