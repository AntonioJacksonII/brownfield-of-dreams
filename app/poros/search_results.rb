class SearchResults

  def repos
    json = GithubService.new.repos
    json.take(5)
  end

  def followers
    json = GithubService.new.followers
    @followers = json.map{|followers_data| Follower.new(followers_data)}
  end

  def following
    json = GithubService.new.following
    @following = json.map{|following_data| Following.new(following_data)}
  end
end
