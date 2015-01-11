json.fullname @repo.fullname
json.comments @repo.comments do |comment|
  json.comment comment.comment
  json.user do
    json.username comment.user.username
  end
end