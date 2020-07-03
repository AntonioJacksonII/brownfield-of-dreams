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
describe GithubService do
  context "instance methods" do
    context "#user_repos" do
      it "returns repo info" do
        service = GithubService.new
        search = service.user_repos
        expect(search).to be_a Array
        repo_data = search.first
        
        expect(repo_data).to have_key :name 
        expect(repo_data).to have_key :html_url 
      end
    end
  end
end