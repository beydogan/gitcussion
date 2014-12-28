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
      @repo.save
    end
    return success(@repo)
  end
end