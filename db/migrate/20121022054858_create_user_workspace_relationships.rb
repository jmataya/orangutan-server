class CreateUserWorkspaceRelationships < ActiveRecord::Migration
  def change
    create_table :user_workspace_relationships do |t|
      t.integer :user_id
      t.integer :workspace_id

      t.timestamps
    end
    add_index :user_workspace_relationships, :user_id
    add_index :user_workspace_relationships, :workspace_id
  end
end
