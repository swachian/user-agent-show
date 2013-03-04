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

ActiveRecord::Schema.define(version: 20130303031322) do

  create_table "user_agent_mys", force: true do |t|
    t.string   "browser_name"
    t.string   "browser_version"
    t.string   "device_model"
    t.string   "device_vendor"
    t.string   "device_type"
    t.string   "engine_name"
    t.string   "engine_version"
    t.string   "os_name"
    t.string   "os_version"
    t.integer  "height"
    t.integer  "width"
    t.string   "ua"
    t.string   "md5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
