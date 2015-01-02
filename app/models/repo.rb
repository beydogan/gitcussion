class Repo < ActiveRecord::Base
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

end
