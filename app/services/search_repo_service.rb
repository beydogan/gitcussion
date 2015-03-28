# SearchRepoService is used to search repos using GitHub api
# It takes a query parameter and returns parsed results using ParseSearchResultService
#
# @example Sample Usage in controller
#   @query = params[:query]
#   @repos = SearchRepoService.new.call(@query)[:payload]
#  
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