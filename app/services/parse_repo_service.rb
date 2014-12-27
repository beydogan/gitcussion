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
    repo.data = item.to_json
    return repo
  end
end