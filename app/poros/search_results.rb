class SearchResults
  def repos
    json = GithubService.new.user_repos
    @repos = json.take(5).map do |repo_data|
      Repo.new(repo_data)
    end
  end

  def followers
    json = GithubService.new.followers
    @followers = json.map { |followers_data| Follower.new(followers_data) }
  end

  def following
    json = GithubService.new.following
    @following = json.map { |following_data| Following.new(following_data) }
  end
end
