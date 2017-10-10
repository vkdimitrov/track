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

ActiveRecord::Schema.define(version: 20171009093735) do

  create_table "runs", force: :cascade do |t|
    t.integer  "duration",                    default: 0
    t.integer  "lowest"
    t.integer  "highest"
    t.float    "average_speed"
    t.integer  "distance"
    t.datetime "start_at"
    t.string   "lat",              limit: 10
    t.string   "lon",              limit: 10
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "gpx_file_name"
    t.string   "gpx_content_type"
    t.integer  "gpx_file_size"
    t.datetime "gpx_updated_at"
  end

  add_index "runs", ["gpx_file_name"], name: "index_runs_on_gpx_file_name"

end
