require 'rails_helper'

describe 'User' do
  it 'user can see a Following section with who they follow' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content('Following')
    expect(page).to have_css('.following-group')
    expect(page).to have_css('.following-individual')
    within(first('.following-individual')) do
      expect(page).to have_css('.following-link')
    end
  end
end
