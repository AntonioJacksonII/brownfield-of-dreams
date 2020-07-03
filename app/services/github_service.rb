class GithubService

  def conn
    Faraday.new('https://api.github.com') do |req|
      req.headers['Authorization'] = "token #{ENV['GITHUB_TOKEN']}"
    end
  end

  def repos
    repos_response = conn.get('/user/repos')
    JSON.parse(repos_response.body, symbolize_names: true)
  end

  def followers
    followers_response = conn.get('/user/followers')
    JSON.parse(followers_response.body, symbolize_names: true)
  end
end
