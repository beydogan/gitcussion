class FetchRepoReadmeService < BaseService
  def call(fullname)
    params = fullname.split("/")
    begin
      res = github_api.repos.contents.readme params[0], params[1]
      readme = res.content
    rescue Exception => e
      return error(e.body)
    end
    readme
  end
end