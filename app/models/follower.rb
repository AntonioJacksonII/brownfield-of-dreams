class Follower < ApplicationRecord
  attr_reader :login, :html_url

  def initialize(data)
    @login = data[:login]
    @html_url = data[:html_url]
  end

  def service
    GithubService.new
  end

  def self.all
    service.followers.map{ |data| Follower.new(data)}
  end
end
