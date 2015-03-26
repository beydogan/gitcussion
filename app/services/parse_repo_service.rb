# ParseRepoService is used to parse api response of a repo to Repo object
# It takes a repo data hash and returns Repo object
#
# @example Sample Usage
#   res = github_api.repos.get params[0], params[1]
#   parse_service = ParseRepoService.new.call(res.body)
#   @repo = parse_service[:payload]
#   
class ParseRepoService < BaseService
  def call(item)
    github_id = item["id"]

    repo = Repo.new
    repo.github_id = item["id"]
    repo.name = item["name"]
    repo.fullname = item["full_name"]
    repo.homepage = item["homepage"]
    repo.stars = item["stargazers_count"]
    repo.watchers = item["watchers_count"]
    repo.forks = item["forks_count"]
    repo.pushed_at = item["pushed_at"]
    repo.avatar_url = item["owner"]["avatar_url"]
    repo.data = JSON.generate(item)
    return success(repo)
  end

end