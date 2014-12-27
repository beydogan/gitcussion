json.array!(@comments) do |comment|
  json.extract! comment, :id, :text, :user_id, :repo_id, :status
  json.url comment_url(comment, format: :json)
end
