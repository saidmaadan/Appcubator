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

ActiveRecord::Schema.define(version: 20140616221337) do

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "github_link"
    t.string   "web_url"
    t.string   "looking_for"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "teams"
    t.decimal  "target_amount"
    t.string   "screenshot_file_name"
    t.string   "screenshot_content_type"
    t.integer  "screenshot_file_size"
    t.datetime "screenshot_updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "name"
    t.integer  "stars"
    t.text     "remark"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["project_id"], name: "index_reviews_on_project_id"

end
