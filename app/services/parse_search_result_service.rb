class ParseSearchResultService < BaseService
  def call(response_hash)
    result = []
    response_hash.each do |item|
      parse_repo_service = ParseRepoService.new.call(item)
      if parse_repo_service[:error]
        return parse_repo_service
      end
      repo =  parse_repo_service[:payload]
      result << repo
    end
    return success(result)
  end

end