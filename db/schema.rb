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

ActiveRecord::Schema.define(:version => 20130604131257) do

  create_table "kimuras", :force => true do |t|
    t.integer  "kimura_page"
    t.string   "kimura_column"
    t.integer  "kimura_lemma"
    t.string   "kimura_reading"
    t.string   "kimura_wadoku_candidates"
    t.boolean  "kimura_isEdited"
    t.boolean  "kimura_hasCandidates"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "user_id"
    t.integer  "wadoku_id"
    t.string   "kimura_writing"
  end

  create_table "links", :force => true do |t|
    t.string   "student"
    t.string   "kimura"
    t.string   "wadoku"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "wadokus", :force => true do |t|
    t.string   "entry"
    t.text     "contents"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
