class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :due_date, :title

  validates :title, presence: true, length: { maximum: 256 }
  validates :description, length: { minimum: 0, maximum: 10000 }
end
