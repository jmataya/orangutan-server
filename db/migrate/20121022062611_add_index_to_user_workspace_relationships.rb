class AddIndexToUserWorkspaceRelationships < ActiveRecord::Migration
  def change
  	add_index :user_workspace_relationships, [:user_id, :workspace_id], uniq: true
  end
end
