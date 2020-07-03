require 'rails_helper'

describe Follower do
  it 'exists' do
    attrs = {
      login: 'GithubUser',
      html_url: 'http://www.github.com/githubuser'
    }

  follower = Follower.new(attrs)

  expect(follower).to be_a Follower
  expect(follower.login).to eq('GithubUser')
  expect(follower.html_url).to eq('http://www.github.com/githubuser')
  end
end
