class SearchRepoService < BaseService
  def call(query)
    response = github_api.search.repos query
    response = response.to_hash["items"]
    repos = ParseSearchResultService.new.call(response)
    return repos
  end
end