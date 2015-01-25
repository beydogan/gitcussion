json.fullname @repo.fullname
json.comments_count @repo.comments.count
json.score @repo.score
json.so_open @repo.so_data["answered_questions"]
json.so_total @repo.so_data["total_questions"]
json.comments @repo.comments do |comment|
  json.(comment, :comment, :created_at)
  json.user do
    json.username comment.user.username
    json.avatar_url comment.user.avatar_url
  end
  json.owner comment.user.username == @repo.data_hash["owner"]["login"]
end
