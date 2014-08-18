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

ActiveRecord::Schema.define(version: 20140818135926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "commenter_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invites", force: true do |t|
    t.string   "email"
    t.integer  "memorial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invites", ["email"], name: "index_invites_on_email", using: :btree

  create_table "memorial_guests", force: true do |t|
    t.integer  "guest_id"
    t.integer  "memorial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memorials", force: true do |t|
    t.integer  "moderator_id"
    t.string   "deceased_name"
    t.datetime "date_of_birth"
    t.datetime "date_of_death"
    t.text     "obituary_description"
    t.text     "service_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memorials", ["moderator_id"], name: "index_memorials_on_moderator_id", using: :btree

  create_table "photos", force: true do |t|
    t.integer  "uploader_id"
    t.integer  "memorial_id"
    t.boolean  "approved"
    t.string   "url"
    t.string   "caption"
    t.boolean  "profile",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "author_id"
    t.integer  "memorial_id"
    t.boolean  "approved"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email_address"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
