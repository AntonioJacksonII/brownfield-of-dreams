require 'rails_helper'

describe 'GithubService' do
  context 'instance methods' do
    context '#followers' do
      it 'returns followers data' do
        service = GithubService.new
        search = service.followers
        expect(search).to be_a Array
        follower_data = search.first

        expect(follower_data).to have_key(:login)
        expect(follower_data).to have_key(:html_url)
      end
    end
  end
end
