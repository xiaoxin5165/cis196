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

ActiveRecord::Schema.define(version: 20160428134555) do

  create_table "followups_statuses", force: :cascade do |t|
    t.integer  "status_id"
    t.integer  "followup_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "followups_statuses", ["followup_id"], name: "index_followups_statuses_on_followup_id"
  add_index "followups_statuses", ["status_id"], name: "index_followups_statuses_on_status_id"

  create_table "friends_users", force: :cascade do |t|
    t.integer  "friend_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friends_users", ["friend_id"], name: "index_friends_users_on_friend_id"
  add_index "friends_users", ["user_id"], name: "index_friends_users_on_user_id"

  create_table "likes_statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes_statuses", ["status_id"], name: "index_likes_statuses_on_status_id"
  add_index "likes_statuses", ["user_id"], name: "index_likes_statuses_on_user_id"

  create_table "requests", force: :cascade do |t|
    t.text     "text"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "requests", ["recipient_id"], name: "index_requests_on_recipient_id"
  add_index "requests", ["sender_id"], name: "index_requests_on_sender_id"

  create_table "statuses", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users_statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_statuses", ["status_id"], name: "index_users_statuses_on_status_id"
  add_index "users_statuses", ["user_id"], name: "index_users_statuses_on_user_id"

end
