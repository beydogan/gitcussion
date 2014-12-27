class ParseSearchResultService < BaseService
  def call(response_hash)
    result = []
    response_hash.each do |item|
      repo = ParseRepoService.new.call(item)
      result << repo
    end
    return result
  end
end