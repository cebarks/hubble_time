require 'rails_helper'

RSpec.describe 'As a user' do
  before(:each) do
    @user = User.create!(email: "user@email.com")
    @favorite = Favorite.create!(user: @user, hubble_id: 666, name: "Test Name", description: "Test Description", credits: "Test Credits", file_url: "hoogle.com")
  end

  describe 'When I visit "/favorites" and click on "Show All"' do
    before(:each) do
      visit favorites_path
      click_on "Show All"
    end

    it "I only see my favorites and not anything else", :vcr do
      expect(current_path).to eq(images_path)
      expect(page).to_not have_css(".image", count: 1)


    end
  end
end
