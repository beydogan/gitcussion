Fabricator(:repo) do
  name { "ruby" }
  fullname { "ruby/ruby" }
  homepage { Faker::Internet.url }
  stars { Random.rand(6)  }
  watchers { Random.rand(50)  }
  forks { Random.rand(6)  }
  so_data { Hash.new }
  comments rand: 5, fabricator: :comment
end