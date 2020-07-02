class GithubService

  def conn
    Faraday.new('https://api.github.com/user') do |req|
      req.headers['Authorization'] = "token #{ENV['github_token']}"
    end
  end

  def followers
    get_url('/followers')
  end

  def get_url(url)
    response = conn.get(url)
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
