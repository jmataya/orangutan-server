class CreateWorkspaceTaskRelationships < ActiveRecord::Migration
  def change
    create_table :workspace_task_relationships do |t|
      t.integer :workspace_id
      t.integer :task_id

      t.timestamps
    end
    add_index :workspace_task_relationships, :workspace_id
    add_index :workspace_task_relationships, :task_id
    add_index :workspace_task_relationships, [:workspace_id, :task_id], uniq: true
  end
end
