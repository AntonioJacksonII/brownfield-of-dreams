class SearchResults
  def repos(token)
    json = GithubService.new.user_repos(token)
    @repos = json.take(5).map do |repo_data|
      Repo.new(repo_data)
    end
  end

  def followers(token)
    json = GithubService.new.followers(token)
    @followers = json.map { |followers_data| Follower.new(followers_data) }
  end

  def following(token)
    json = GithubService.new.following(token)
    @following = json.map { |following_data| Following.new(following_data) }
  end

  def playlist_videos
    json = YoutubeService.new.playlist_videos
    @videos = json.map { |video_data| PlaylistVideo.new(video_data) }
  end
end
