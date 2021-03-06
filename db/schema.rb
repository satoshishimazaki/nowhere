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

ActiveRecord::Schema.define(version: 20150526215928) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "article_images", force: true do |t|
    t.string   "image"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_one"
    t.string   "image_two"
    t.string   "image_three"
    t.string   "image_four"
    t.string   "image_five"
    t.string   "image_six"
  end

  create_table "articles", force: true do |t|
    t.string   "herenowtitle"
    t.string   "title"
    t.text     "content"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.integer  "view_count",   default: 0
    t.string   "image_one"
    t.string   "image_two"
    t.string   "image_three"
    t.string   "image_four"
    t.string   "image_five"
    t.string   "category"
    t.string   "station"
    t.string   "recommend",    default: "0"
  end

  add_index "articles", ["store_id", "created_at"], name: "index_articles_on_store_id_and_created_at"

  create_table "articles_article_images", id: false, force: true do |t|
    t.integer "article_id",       null: false
    t.integer "article_image_id", null: false
  end

  add_index "articles_article_images", ["article_id"], name: "index_articles_article_images_on_article_id"
  add_index "articles_article_images", ["article_image_id"], name: "index_articles_article_images_on_article_image_id"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.string   "user_name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

  create_table "inquiries", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "tel"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "category"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "station"
    t.string   "url_sec"
    t.string   "address_sec"
    t.string   "holiday"
    t.string   "managetime"
    t.string   "profile"
  end

  add_index "stores", ["email"], name: "index_stores_on_email", unique: true
  add_index "stores", ["remember_token"], name: "index_stores_on_remember_token"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

  create_table "users_article_images", id: false, force: true do |t|
    t.integer "user_id",          null: false
    t.integer "article_image_id", null: false
  end

  add_index "users_article_images", ["article_image_id"], name: "index_users_article_images_on_article_image_id"
  add_index "users_article_images", ["user_id"], name: "index_users_article_images_on_user_id"

  create_table "views", force: true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "views", ["article_id"], name: "index_views_on_article_id"
  add_index "views", ["user_id", "article_id"], name: "index_views_on_user_id_and_article_id", unique: true
  add_index "views", ["user_id"], name: "index_views_on_user_id"

end
