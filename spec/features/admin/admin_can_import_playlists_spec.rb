require 'rails_helper'

describe "As an admin", type: :feature do
  describe "When I visit '/admin/tutorials/new'" do
    before(:each) do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    end

    it "I see a link 'Import Youtube Playlist'" do
      visit new_admin_tutorial_path

      expect(page).to have_link('Import YouTube Playlist')
    end

    xit "when I click the link I should see a form" do
      visit new_admin_tutorial_path

      click_link('Import YouTube Playlist')

      expect(current_path).to eq(new_admin_playlist_path)

      expect(page).to have_content("Please enter valid playlist ID")
      fill_in "Title", with: "POP music playlist 2020"
      fill_in "Playlist ID",	with: "PL4o29bINVT4EG_y-k5jGoOu3-Am8Nvi10"
      fill_in "Description",	with: "Playlist description"

      click_button('Import')

      expect(current_path).to eq(admin_dashboard_path)

      expect(page).to have_content("Successfully created tutorial.")
      # expect(page).to have_link("View it here")

      # click_link('View it here')

      visit("/tutorials/#{Tutorial.last.id}")

      expect("Maroon 5 - Memories (Official Video)").to appear_before("Dua Lipa - Don't Start Now (Official Music Video)")
      expect(page).to have_content("The Weeknd - Blinding Lights (Official Music Video")
    end
  end
end

# As an admin
# Then I should see a link for 'Import YouTube Playlist'
# When I click 'Import YouTube Playlist'
# Then I should see a form

# And when I fill in 'Playlist ID' with a valid ID
# Then I should be on '/admin/dashboard'
# And I should see a flash message that says 'Successfully created tutorial. View it here.'
# And 'View it here' should be a link to '/tutorials/:id'
# And when I click on 'View it here'
# Then I should be on '/tutorials/:id'
# And I should see all videos from the YouTube playlist
# And the order should be the same as it was on YouTube
