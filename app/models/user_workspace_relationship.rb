class UserWorkspaceRelationship < ActiveRecord::Base
  attr_accessible :user_id, :workspace_id

  belongs_to :user
  belongs_to :workspace

  validates :user, presence: true
  validates :workspace, presence: true
end
