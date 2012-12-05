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

ActiveRecord::Schema.define(:version => 20121205000457) do

  create_table "artists", :force => true do |t|
    t.integer  "event_id"
    t.string   "artistName"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "event_start_time"
    t.datetime "event_end_time"
    t.float    "cost"
    t.string   "location"
    t.text     "description"
    t.datetime "registration_deadline"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "food"
    t.string   "event_type"
    t.integer  "createdby_user_id"
  end

  create_table "hosts", :force => true do |t|
    t.integer  "event_id"
    t.string   "hostName"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "myevents", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "email"
    t.integer  "phone"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "speakers", :force => true do |t|
    t.integer  "event_id"
    t.string   "speakerName"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sponsors", :force => true do |t|
    t.integer  "event_id"
    t.string   "sponsorName"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
