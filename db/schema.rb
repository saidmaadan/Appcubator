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

ActiveRecord::Schema.define(version: 20140710002943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: true do |t|
    t.string   "strenght"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "associations", force: true do |t|
    t.integer  "user_id"
    t.integer  "ability_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "associations", ["ability_id"], name: "index_associations_on_ability_id", using: :btree
  add_index "associations", ["user_id"], name: "index_associations_on_user_id", using: :btree

  create_table "categorizations", force: true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["skill_id"], name: "index_categorizations_on_skill_id", using: :btree
  add_index "categorizations", ["user_id"], name: "index_categorizations_on_user_id", using: :btree

  create_table "checkins", force: true do |t|
    t.string   "skills"
    t.integer  "experience"
    t.string   "position"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
    t.integer  "user_id"
  end

  add_index "checkins", ["idea_id"], name: "index_checkins_on_idea_id", using: :btree

  create_table "classifications", force: true do |t|
    t.integer  "user_id"
    t.integer  "proficiency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "classifications", ["proficiency_id"], name: "index_classifications_on_proficiency_id", using: :btree
  add_index "classifications", ["user_id"], name: "index_classifications_on_user_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["project_id"], name: "index_follows_on_project_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "ideas", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "goal"
    t.string   "category"
    t.string   "market"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proficiencies", force: true do |t|
    t.string   "expert"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.integer  "user_id"
  end

  create_table "reviews", force: true do |t|
    t.integer  "stars"
    t.text     "remark"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "reviews", ["project_id"], name: "index_reviews_on_project_id", using: :btree

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",           default: false
    t.text     "about"
    t.text     "achievements"
    t.text     "powerpoint"
    t.string   "specialization"
    t.string   "location"
    t.string   "sex"
    t.datetime "birthdate"
    t.string   "phone"
    t.text     "school"
    t.string   "work"
    t.string   "marital"
    t.string   "video"
    t.string   "github"
    t.string   "twitter"
    t.string   "dribbble"
    t.string   "linkedin"
    t.string   "codeeval"
    t.string   "degree"
    t.string   "start_year"
    t.string   "grad_year"
  end

  create_table "votes", force: true do |t|
    t.integer  "idea_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["idea_id"], name: "index_votes_on_idea_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
