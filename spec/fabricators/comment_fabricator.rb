Fabricator(:comment) do
  comment {  Faker::Lorem.sentence }
  user
end