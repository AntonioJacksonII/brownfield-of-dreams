require 'rails_helper'

describe Repo, type: :model do 
  it "exists" do
    attrs = {
      name: "Brownfield-of-dreams",
      html_url: "www.url.com"
    }
    repo = Repo.new(attrs)

    expect(repo).to be_a Repo  
    expect(repo.name).to eq("Brownfield-of-dreams") 
    expect(repo.html_url).to eq("www.url.com") 
  end
end