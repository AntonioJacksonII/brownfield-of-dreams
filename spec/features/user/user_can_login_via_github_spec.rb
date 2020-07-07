require 'rails_helper'

describe 'User' do
  before :each do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      :provider => 'github',
      :info => {:email => user.email},
      :credentials => {:token => ENV['GITHUB_TOKEN']}
    })
  end
  it 'user can login via Github' do
    visit dashboard_path
    click_link 'Connect to Github'
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_css('.github')
    expect(page).to have_css('.followers')
    expect(page).to have_css('.following-group')
  end
end
