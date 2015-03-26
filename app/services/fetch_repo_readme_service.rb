# FetchRepoReadmeService is used to get a repo's readme by reponame
# It gets readme from GitHub using octokit gem
# @example Sample Usage
#   readme_service =FetchRepoReadmeService.new.call(fullname)
#   if readme_service[:status] != :error
#     @readme = readme_service[:payload]
#   end
#   
class FetchRepoReadmeService < BaseService
  def call(fullname)
    begin
      readme = octokit.readme(fullname, accept:"application/vnd.github.VERSION.html")
    rescue Octokit::NotFound
      return success("No Readme File :(")
    rescue Exception => e
      return error(e.message)
    end
    success(readme)
  end

end