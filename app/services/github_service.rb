class GithubService

  def followers
    conn = Faraday.new('https://api.github.com') do |req|
      req.headers['Authorization'] = "token #{ENV['GITHUB_TOKEN']}"
    end

    response = conn.get('/user/repos')
    json = JSON.parse(response.body, symbolize_names: true)
    @repos = json.take(5)

    followers_response = conn.get('/user/followers')
    parsed_followers = JSON.parse(followers_response.body, symbolize_names: true)
  end
end
