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

ActiveRecord::Schema.define(:version => 20131109181255) do

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

  add_index "people", ["name"], :name => "index_people_on_name", :unique => true

  create_table "synonyms", :force => true do |t|
    t.integer  "person_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "synonyms", ["person_id", "name"], :name => "index_synonyms_on_person_id_and_name", :unique => true

  create_table "twitt_people", :force => true do |t|
    t.integer  "twitt_id"
    t.integer  "person_id"
    t.integer  "first"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "twitt_people", ["person_id"], :name => "index_twitt_people_on_person_id"
  add_index "twitt_people", ["twitt_id", "person_id"], :name => "index_twitt_people_on_twitt_id_and_person_id", :unique => true

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

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
