class AssignedTask < ActiveRecord::Base
  attr_accessible :task_id, :user_id

  belongs_to :user
  belongs_to :task

  validates :user, presence: true
  validates :task, presence: true
end
