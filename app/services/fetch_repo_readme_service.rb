# encoding: utf-8

class FetchRepoReadmeService < BaseService
  def call(fullname)
    params = fullname.split("/")
    begin
      res = github_api.repos.contents.readme params[0], params[1]
      readme_base64 = res.content
      decoded = Base64.decode64 readme_base64
      decoded = decoded.force_encoding("UTF-8")
      readme = github_api.markdown.render text: decoded, mode: "markdown"
    rescue Exception => e
      return error(e.message)
    end
    success(readme.body)
  end

end