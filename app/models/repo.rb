class Repo < ActiveRecord::Base
  serialize :so_data, Hash
  has_many :comments
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
