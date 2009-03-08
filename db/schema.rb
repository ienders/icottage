# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080928213653) do

  create_table "articles", :force => true do |t|
    t.integer  "user_id",        :limit => 11
    t.text     "body"
    t.integer  "comments_count", :limit => 11, :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "bookings", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookings_users", :id => false, :force => true do |t|
    t.integer "user_id",    :limit => 11, :null => false
    t.integer "booking_id", :limit => 11, :null => false
  end

  add_index "bookings_users", ["user_id"], :name => "index_bookings_users_on_user_id"
  add_index "bookings_users", ["booking_id"], :name => "index_bookings_users_on_booking_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id",          :limit => 11
    t.integer  "commentable_id",   :limit => 11
    t.string   "commentable_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"
  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"

  create_table "galleries", :force => true do |t|
    t.integer  "user_id",      :limit => 11
    t.string   "name"
    t.integer  "photos_count", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "galleries", ["user_id"], :name => "index_galleries_on_user_id"

  create_table "photos", :force => true do |t|
    t.integer  "gallery_id",     :limit => 11
    t.string   "filename"
    t.integer  "width",          :limit => 11
    t.integer  "height",         :limit => 11
    t.integer  "comments_count", :limit => 11, :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["gallery_id"], :name => "index_photos_on_gallery_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.boolean  "is_admin",                                :default => false
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
