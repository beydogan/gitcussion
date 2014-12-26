json.array!(@repos) do |repo|
  json.extract! repo, :id, :name, :fullname, :homepage, :stars, :watchers, :forks, :pushed_at, :html_url, :data
  json.url repo_url(repo, format: :json)
end
