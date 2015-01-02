class FetchRepoReadmeService < BaseService
  def call(fullname)
    begin
      readme = octokit.readme(fullname, accept:"application/vnd.github.VERSION.html")
    rescue Exception => e
      return error(e.message)
    end
    success(readme)
  end

end