require 'rails_helper'

describe Following do
  it 'exists' do
    attrs = {
      login: 'GithubUser',
      html_url: 'http://www.github.com/githubuser'
    }

  following = Following.new(attrs)

  expect(following).to be_a Following
  expect(following.login).to eq('GithubUser')
  expect(following.html_url).to eq('http://www.github.com/githubuser')
  end
end
