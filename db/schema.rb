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

ActiveRecord::Schema.define(version: 20161222210953) do

  create_table "pfeatures", force: :cascade do |t|
    t.string   "name"
    t.datetime "fdate"
    t.integer  "active_status"
    t.integer  "sort"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "product_features", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_id"
    t.integer  "pfeature_id"
    t.integer  "active_status"
    t.integer  "sort"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "product_features", ["pfeature_id"], name: "index_product_features_on_pfeature_id"
  add_index "product_features", ["product_id"], name: "index_product_features_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.datetime "pdate"
    t.integer  "active_status"
    t.integer  "sort"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "active_status"
    t.integer  "sort"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",          default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "reset_password_redirect_url"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "confirm_success_url"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "provider"
    t.string   "uid",                         default: "", null: false
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "favorite_color"
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true

end
