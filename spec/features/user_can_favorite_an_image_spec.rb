require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit /images and click on a "favorite" button', :vcr do
    before(:each) do
      User.create!(email: "user@email.com")
      visit images_path

      within "#image-4381" do
        click_on 'Favorite'
      end
    end

    it "the image is added to my favorites" do
      expect(page).to have_content("Favorite was added.")
    end

    it "the button dissappears" do
      within "#image-4381" do
        expect(page).to_not have_css('.favorite-button')
      end
    end
  end
end
