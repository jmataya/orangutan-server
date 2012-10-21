class Workspace < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, presence: true, length: { maximum: 256 }
  validates :description, length: { minimum: 0, maximum: 10000 }
end
