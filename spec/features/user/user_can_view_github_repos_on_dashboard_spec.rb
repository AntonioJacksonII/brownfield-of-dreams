require 'rails_helper'

describe 'User' do
  it 'user can see a GitHub section' do
    user = create(:user)

    visit '/'

    click_on "Sign In"

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Github")
  end
end
