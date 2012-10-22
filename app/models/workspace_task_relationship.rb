class WorkspaceTaskRelationship < ActiveRecord::Base
  attr_accessible :task_id, :workspace_id

  belongs_to :task
  belongs_to :workspace

  validates :task, presence: true
  validates :workspace, presence: true
end
