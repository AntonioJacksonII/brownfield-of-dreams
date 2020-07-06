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

  def playlist_videos
    json = YoutubeService.new.playlist_videos
    @videos = json.map { |video_data| PlaylistVideo.new(video_data) }
  end
end
