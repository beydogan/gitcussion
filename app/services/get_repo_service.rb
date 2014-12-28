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