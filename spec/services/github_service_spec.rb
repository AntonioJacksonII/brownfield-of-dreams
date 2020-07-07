require 'rails_helper'

describe 'GithubService' do
  context 'instance methods' do
    before :each do
      @user = create(:user)
    end
    context '#followers' do
      it 'returns followers data' do
        service = GithubService.new
        search = service.followers(@user.github_token)
        expect(search).to be_a Array
        follower_data = search.first

        expect(follower_data).to have_key(:login)
        expect(follower_data).to have_key(:html_url)
      end
    end
    context '#following' do
      it 'returns data on who user is following' do
        service = GithubService.new
        search = service.following(@user.github_token)
        expect(search).to be_a Array
        following_data = search.first
        expect(following_data).to have_key(:login)
        expect(following_data).to have_key(:html_url)
      end
    end
    context "#user_repos" do
      it "returns repo info" do
        service = GithubService.new
        search = service.user_repos(@user.github_token)
        expect(search).to be_a Array
        repo_data = search.first

        expect(repo_data).to have_key :name
        expect(repo_data).to have_key :html_url
      end
    end
  end
end
