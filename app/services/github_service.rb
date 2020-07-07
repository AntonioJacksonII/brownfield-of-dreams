class GithubService
  def user_repos(token)
    response = conn(token).get('/user/repos')
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(token)
    Faraday.new('https://api.github.com') do |req|
      req.headers['Authorization'] = "token #{token}"
    end
  end

  def followers(token)
    followers_response = conn(token).get('/user/followers')
    JSON.parse(followers_response.body, symbolize_names: true)
  end

  def following(token)
    following_response = conn(token).get('/user/following')
    JSON.parse(following_response.body, symbolize_names: true)
  end
end
