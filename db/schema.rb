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

ActiveRecord::Schema.define(version: 20150714160715) do

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

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["project_id"], name: "index_follows_on_project_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "ideas", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "goal"
    t.string   "category"
    t.string   "market"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "job_title"
    t.text     "job_details"
    t.string   "experience"
    t.string   "employment_type"
    t.text     "desire_skill"
    t.string   "location"
    t.string   "state"
    t.string   "country"
    t.string   "zip_code"
    t.string   "salary"
    t.string   "other_pay"
    t.string   "relocation"
    t.string   "required_travel"
    t.string   "company_name"
    t.text     "company_description"
    t.string   "website"
    t.string   "application_link"
    t.text     "key_responsibility"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "industry"
    t.string   "company_size"
    t.string   "salary_rate"
    t.integer  "user_id"
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
    t.string   "slug"
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree

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

  create_table "trends", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "source_url"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.string   "twitter_url"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",            default: false
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
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "slug"
  end

  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "idea_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["idea_id"], name: "index_votes_on_idea_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
