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

ActiveRecord::Schema.define(:version => 20130618020033) do

  create_table "pages", :force => true do |t|
    t.integer  "version_id",              :null => false
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "asset_file"
    t.string   "asset_file_name",         :null => false
    t.integer  "asset_file_size"
    t.string   "asset_file_content_type"
    t.integer  "page_number"
  end

  add_index "pages", ["version_id", "page_number"], :name => "index_pages_on_version_id_and_page_number", :unique => true

  create_table "songs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "titles", :force => true do |t|
    t.integer  "song_id",    :null => false
    t.string   "name",       :null => false
    t.boolean  "primary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "titles", ["song_id", "name"], :name => "index_titles_on_song_id_and_name", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "song_id",     :null => false
  end

end
