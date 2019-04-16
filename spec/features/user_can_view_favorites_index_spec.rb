require 'rails_helper'

RSpec.describe 'As a user' do
  before(:each) do
    @user = User.create!(email: "user@email.com")
    @favorite = Favorite.create!(user: @user, hubble_id: 666, name: "Test Name", description: "Test Description", credits: "Test Credits", file_url: "hoogle.com")
  end

  describe 'When I visit "/images" and click on "Show Favorites Only"' do
    before(:each) do
      visit images_path
      click_on "Show Favorites Only"
    end

    it "I only see my favorites and not anything else", :vcr do
      expect(page).to have_css(".image", count: 1)

      within "#image-666" do
        expect(page).to have_content("Test Name")
        expect(page).to have_content("Test Description")
        expect(page).to have_content("Test Credits")
        expect(page.find(".picture")['src']).to have_content("hoogle.com")
      end
    end
  end
end
