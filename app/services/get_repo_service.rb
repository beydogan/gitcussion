# GetRepoService is used to get repo from GitHub by reponame
#
# @example Sample Usage
# 	repo_service = GetRepoService.new.call(fullname)
# 	if repo_service[:status] != :error
# 		@repo = repo_service[:payload]
# 	end
#
class GetRepoService < BaseService
  def call(fullname)
    params = fullname.split("/")
    begin
      res = github_api.repos.get params[0], params[1]
    rescue Exception => e
      return error(e.body)
    end
    ParseRepoService.new.call(res.body)
  end
end