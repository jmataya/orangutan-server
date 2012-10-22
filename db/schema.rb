# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121022222919) do

  create_table "assigned_tasks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "assigned_tasks", ["task_id"], :name => "index_assigned_tasks_on_task_id"
  add_index "assigned_tasks", ["user_id", "task_id"], :name => "index_assigned_tasks_on_user_id_and_task_id"
  add_index "assigned_tasks", ["user_id"], :name => "index_assigned_tasks_on_user_id"

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "due_date"
    t.boolean  "completed",   :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "user_workspace_relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "workspace_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "user_workspace_relationships", ["user_id", "workspace_id"], :name => "index_user_workspace_relationships_on_user_id_and_workspace_id"
  add_index "user_workspace_relationships", ["user_id"], :name => "index_user_workspace_relationships_on_user_id"
  add_index "user_workspace_relationships", ["workspace_id"], :name => "index_user_workspace_relationships_on_workspace_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "workspace_task_relationships", :force => true do |t|
    t.integer  "workspace_id"
    t.integer  "task_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "workspace_task_relationships", ["task_id"], :name => "index_workspace_task_relationships_on_task_id"
  add_index "workspace_task_relationships", ["workspace_id", "task_id"], :name => "index_workspace_task_relationships_on_workspace_id_and_task_id"
  add_index "workspace_task_relationships", ["workspace_id"], :name => "index_workspace_task_relationships_on_workspace_id"

  create_table "workspaces", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
