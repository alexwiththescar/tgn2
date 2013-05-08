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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130507152937) do

  create_table "products", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.decimal  "ammount",          :precision => 10, :scale => 0
    t.decimal  "price",            :precision => 10, :scale => 0
    t.boolean  "organic"
    t.boolean  "delivery"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.float    "pic_file_size"
    t.datetime "pic_updated_at"
    t.boolean  "delta",                                           :default => true, :null => false
  end

  add_index "products", ["user_id", "created_at"], :name => "index_products_on_user_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",               :default => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "farm_name"
    t.string   "location"
    t.string   "grown_produce"
    t.string   "wanted_produce"
    t.string   "description"
    t.string   "album_file_name"
    t.string   "album_content_type"
    t.string   "album_file_size"
    t.datetime "album_updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "seller"
    t.string   "location_state"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
