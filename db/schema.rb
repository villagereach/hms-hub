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

ActiveRecord::Schema.define(:version => 20110523114135) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "message_streams", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "message_streams", ["name"], :name => "index_message_streams_on_name", :unique => true

  create_table "messages", :force => true do |t|
    t.integer  "message_stream_id"
    t.string   "name"
    t.string   "sms_text"
    t.string   "ivr_code"
    t.integer  "offset_days"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["message_stream_id", "name"], :name => "index_messages_on_message_stream_id_and_name", :unique => true

  create_table "notifications", :force => true do |t|
    t.string   "uuid"
    t.integer  "notifier_id"
    t.integer  "message_id"
    t.string   "first_name"
    t.string   "phone_number"
    t.string   "delivery_method"
    t.datetime "delivery_start"
    t.datetime "delivery_expires"
    t.integer  "delivery_window",  :limit => 255
    t.string   "status"
    t.string   "last_error_type"
    t.text     "last_error_msg"
    t.datetime "last_run_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["last_run_at", "notifier_id"], :name => "index_notifications_on_last_run_at_and_notifier_id"
  add_index "notifications", ["notifier_id", "uuid"], :name => "index_notifications_on_notifier_id_and_uuid", :unique => true

  create_table "notifiers", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "timezone"
    t.datetime "last_login_at"
    t.datetime "last_status_req_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifiers", ["username"], :name => "index_notifiers_on_username", :unique => true

end
