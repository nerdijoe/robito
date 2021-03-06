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

ActiveRecord::Schema.define(version: 20170116130216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.string   "brand_name"
    t.text     "description"
    t.string   "company_name"
    t.string   "email"
    t.integer  "phone_number"
    t.string   "address"
    t.string   "link"
    t.json     "image"
  end

  add_index "brands", ["user_id"], name: "index_brands_on_user_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.text     "description"
    t.string   "product_name"
    t.string   "company_name"
    t.string   "email"
    t.integer  "phone_number"
    t.string   "address"
    t.string   "link"
    t.json     "image"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "brand_id"
    t.string   "tag"
    t.integer  "age"
    t.integer  "gender"
    t.string   "interests"
    t.integer  "location"
    t.integer  "product_category"
  end

  add_index "campaigns", ["brand_id"], name: "index_campaigns_on_brand_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "accesstoken"
    t.string   "refreshtoken"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.string   "image"
    t.string   "phone"
    t.string   "urls"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "influencers", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "age"
    t.integer  "product_category"
    t.integer  "location"
    t.integer  "gender"
    t.string   "interests"
  end

  add_index "influencers", ["user_id"], name: "index_influencers_on_user_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "influencer_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "status",        default: 0, null: false
    t.integer  "reward",        default: 0, null: false
  end

  add_index "requests", ["campaign_id"], name: "index_requests_on_campaign_id", using: :btree
  add_index "requests", ["influencer_id"], name: "index_requests_on_influencer_id", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "target"
    t.string   "prize"
    t.text     "description"
    t.date     "post_date"
    t.date     "deadline"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rewards", ["campaign_id"], name: "index_rewards_on_campaign_id", using: :btree

  create_table "searches", force: :cascade do |t|
    t.string   "keyword"
    t.string   "product_category"
    t.string   "location"
    t.string   "age"
    t.string   "gender"
    t.string   "interests"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role",                   default: 0,  null: false
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "brands", "users"
  add_foreign_key "campaigns", "brands"
  add_foreign_key "identities", "users"
  add_foreign_key "influencers", "users"
  add_foreign_key "rewards", "campaigns"
end
