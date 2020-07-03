require 'rails_helper'

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