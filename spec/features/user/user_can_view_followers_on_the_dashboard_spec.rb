require 'rails_helper'

describe 'User' do
  it 'user can see a Followers section with their followers' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content('Followers')
    expect(page).to have_css('.followers')
    expect(page).to have_css('.follower')
    within(first('.follower')) do
      expect(page).to have_css('.follower-link')
    end
  end
end
