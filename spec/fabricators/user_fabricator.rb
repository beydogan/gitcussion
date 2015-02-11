Fabricator(:user) do
  email { Faker::Internet.email }
  password "strongpassword"
end