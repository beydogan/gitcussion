class Repo < ActiveRecord::Base
  has_many :comments
  def data_hash
    JSON.parse(self.data)
  end

  def to_param
    fullname
  end
end
