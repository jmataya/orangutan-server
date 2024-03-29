class Workspace < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :user_workspace_relationships, dependent: :destroy
  has_many :users, through: :user_workspace_relationships, source: :user

  has_many :workspace_task_relationships, dependent: :destroy
  has_many :tasks, through: :workspace_task_relationships, source: :task

  validates :name, presence: true, length: { maximum: 256 }
  validates :description, length: { minimum: 0, maximum: 10000 }
end
