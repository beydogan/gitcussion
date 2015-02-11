class Repo < ActiveRecord::Base
  ratyrate_rateable "star"

  serialize :so_data, Hash
  has_many :comments, -> { order(created_at: :desc) }
  def data_hash
    JSON.parse(self.data)
  end

  def to_param
    fullname
  end

  def tag
    name.gsub(" ", "-")
  end

  def score
    average("star") ? average("star").avg : 0.0
  end

  def self.top_commented(count = 10)
    self.select("repos.*, COUNT(repo_id) as comment_count").
        joins(:comments).
        group("repos.id").
        order("comment_count DESC").
        limit(count)
  end

end
