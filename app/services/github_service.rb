class GithubService 
  def user_repos
    response = conn.get('/user/repos')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.github.com') do |req|
      req.headers['Authorization'] = "token #{ENV['GITHUB_TOKEN']}"
    end
  end
end