class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates :body, :presence => true
  validates :title, :presence => true

  attr_accessible :title, :body

  def tag_str
    self.tags.map(&:name).join(",")
  end
end
