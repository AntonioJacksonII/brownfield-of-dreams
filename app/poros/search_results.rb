class SearchResults

  def repos
    conn = Faraday.new('https://api.github.com') do |req|
      req.headers['Authorization'] = "token #{ENV['GITHUB_TOKEN']}"
    end

    response = conn.get('/user/repos')
    json = JSON.parse(response.body, symbolize_names: true)
    json.take(5)
  end

  def followers
    json = GithubService.new.followers
    @followers = json.map{|followers_data| Follower.new(followers_data)}
  end


end
