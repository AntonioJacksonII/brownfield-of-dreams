require 'rails_helper'

describe 'User' do
  it 'user can login via Github' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_path
    click_on 'Connect to Github'

    expect(current_path).to eq(dashboard_path)
  end
end
