# FindRepoService is used to get repo data by reponame
# It gets repo from database if it exist.
# If it doesn't exist on database, it gets from GitHub.
# First, it fetches Repo data then Readme file and then StackOverflow data
# Then it saves repo to database and returns it.
#
# @example Sample Usage
#   repo_service = FindRepoService.new.call(params[:id])
#   if repo_service[:status] != :error
#     @repo = repo_service[:payload]
#   end
#
class FindRepoService < BaseService
  def call(fullname)
    @repo = Repo.includes(:comments).find_by(fullname: fullname)#Search db
    if @repo.nil?   #get from api if not in db and save it
      repo_service = GetRepoService.new.call(fullname)
      if repo_service[:status] == :error
        return repo_service
      end
      readme_service = FetchRepoReadmeService.new.call(fullname)
      if readme_service[:status] == :error
        return readme_service
      end
      @repo = repo_service[:payload]
      @repo.readme = readme_service[:payload]

      so_service = StackoverflowService.new.call(@repo.tag)
      @repo.so_data = so_service[:payload]
      @repo.save
    end
    return success(@repo)
  end
end