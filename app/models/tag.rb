class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  validates :name, :presence => true

  def self.tags_from_str(tags_str)
    tags = tags_str.split(",").map do |name|
      self.find_or_create_by_name(name)
    end
    tags
  end  
end
