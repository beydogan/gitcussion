class SearchRepoService < BaseService
  def call(query)
    response = github_api.search.repos query
    response = response.to_hash["items"]
    parse_service = ParseSearchResultService.new.call(response)
    if parse_service[:error]
      return parse_service
    else
      return success(parse_service[:payload])
    end
  end

end