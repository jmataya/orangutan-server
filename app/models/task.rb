class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :due_date, :title

  has_many :assigned_tasks, dependent: :destroy
  has_many :users, through: :assigned_tasks, source: :user

  validates :title, presence: true, length: { maximum: 256 }
  validates :description, length: { minimum: 0, maximum: 10000 }
end
