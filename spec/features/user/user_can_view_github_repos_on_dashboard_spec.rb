require 'rails_helper'

describe 'User' do
  it 'user can see a Github section' do
    user = create(:user)

    visit '/'

    click_on "Sign In"

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content('Github')
  end

  it 'user can see their Github repos' do
    user = create(:user)

    visit '/'

    click_on "Sign In"

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content('Github')
    expect(page).to have_css('.github')
    expect(page).to have_css('.repo', count: 5)

    within(first('.repo')) do
      expect(page).to have_css('.repo-link')
    end
  end
end
