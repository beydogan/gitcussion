require 'github_api'

class BaseService
  def github_api
    Github.new
  end
end