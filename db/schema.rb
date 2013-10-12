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

ActiveRecord::Schema.define(:version => 20131011193919) do

  create_table "game_people", :force => true do |t|
    t.integer  "game_id"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "game_people", ["game_id", "person_id"], :name => "index_game_persons_on_game_id_and_person_id", :unique => true
  add_index "game_people", ["person_id"], :name => "index_game_persons_on_person_id"

  create_table "games", :force => true do |t|
    t.datetime "ddateb"
    t.datetime "ddatee"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "twitts", :force => true do |t|
    t.string   "id_str"
    t.datetime "ddate"
    t.string   "text"
    t.string   "from_user"
    t.integer  "game_id"
    t.integer  "person_id"
    t.integer  "result"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "twitts", ["game_id"], :name => "index_twitts_on_game_id"
  add_index "twitts", ["id_str"], :name => "index_twitts_on_id_str", :unique => true

end
