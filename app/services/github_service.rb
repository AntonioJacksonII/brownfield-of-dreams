class GithubService
  def user_repos
    response = conn.get('/user/repos')
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.github.com') do |req|
      req.headers['Authorization'] = "token #{ENV['GITHUB_TOKEN']}"
    end
  end

  def followers
    followers_response = conn.get('/user/followers')
    JSON.parse(followers_response.body, symbolize_names: true)
  end

  def following
    following_response = conn.get('/user/following')
    JSON.parse(following_response.body, symbolize_names: true)
  end
end
