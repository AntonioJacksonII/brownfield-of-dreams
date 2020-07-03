class RepoResults 
  def repos
    json = GithubService.new.user_repos
    @repos = json.take(5).map do |repo_data|
      Repo.new(repo_data)
    end
  end 
end