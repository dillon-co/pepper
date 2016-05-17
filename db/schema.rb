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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160509183847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "date",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.text     "tasks",       null: false
    t.integer  "team_id"
  end

  add_index "events", ["team_id"], name: "index_events_on_team_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "message",                        null: false
    t.text     "specific_users", default: "all"
    t.integer  "team_id"
  end

  add_index "messages", ["team_id"], name: "index_messages_on_team_id", using: :btree

  create_table "messages_users", id: false, force: :cascade do |t|
    t.integer "message_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "messages_users", ["message_id", "user_id"], name: "index_messages_users_on_message_id_and_user_id", using: :btree
  add_index "messages_users", ["user_id", "message_id"], name: "index_messages_users_on_user_id_and_message_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.integer  "user_number"
    t.string   "user_name"
    t.text     "response_body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "task_delegations", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "event"
    t.datetime "event_date"
    t.text     "tasks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "task_delegations", ["team_id"], name: "index_task_delegations_on_team_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name",                        null: false
    t.text     "message",                     null: false
    t.string   "time",                        null: false
    t.integer  "day_of_week",  default: 1
    t.integer  "day_of_month", default: 1
    t.boolean  "enabled",      default: true
    t.string   "cron_time"
    t.integer  "team_id"
  end

  add_index "tasks", ["team_id"], name: "index_tasks_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "email",                   default: "",    null: false
    t.string   "encrypted_password",      default: "",    null: false
    t.string   "team_name",                               null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "weekly_reminder_enabled", default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "teams", ["email"], name: "index_teams_on_email", unique: true, using: :btree
  add_index "teams", ["reset_password_token"], name: "index_teams_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "number",                       null: false
    t.string   "name",                         null: false
    t.string   "message",                      null: false
    t.integer  "order_number", default: 0,     null: false
    t.boolean  "is_next",      default: false
    t.boolean  "girl",         default: false
    t.boolean  "available",    default: true
    t.integer  "team_id"
  end

  add_index "users", ["team_id"], name: "index_users_on_team_id", using: :btree

  add_foreign_key "events", "teams"
  add_foreign_key "messages", "teams"
  add_foreign_key "tasks", "teams"
  add_foreign_key "users", "teams"
end
