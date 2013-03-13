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

ActiveRecord::Schema.define(:version => 20130313190454) do

  create_table "charities", :force => true do |t|
    t.integer  "race_id"
    t.integer  "order"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "enabled",    :default => true
  end

  create_table "options", :force => true do |t|
    t.string "key"
    t.text   "value"
  end

  create_table "races", :force => true do |t|
    t.date    "race_date"
    t.string  "title"
    t.string  "title2"
    t.text    "description"
    t.text    "how_it_workd"
    t.text    "rules"
    t.text    "map_embed_url"
    t.integer "status"
    t.text    "eventioz_link"
  end

  create_table "sponsors", :force => true do |t|
    t.integer  "race_id"
    t.integer  "order"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "votes", :force => true do |t|
    t.string   "email"
    t.integer  "city_id"
    t.string   "other"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
