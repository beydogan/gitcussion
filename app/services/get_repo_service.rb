class GetRepoService < BaseService
  def call(owner, repo)
    res = github_api.repos.get owner, repo
    ParseRepoService.new.call(res)
  end
end