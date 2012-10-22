class CreateAssignedTasks < ActiveRecord::Migration
  def change
    create_table :assigned_tasks do |t|
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
    add_index :assigned_tasks, :user_id
    add_index :assigned_tasks, :task_id
    add_index :assigned_tasks, [:user_id, :task_id], uniq: true
  end
end
