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

ActiveRecord::Schema.define(version: 20150614205102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "center"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "zoom",       default: 10
  end

  create_table "front_end_builds_apps", force: true do |t|
    t.string   "name"
    t.string   "api_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "require_manual_activation", default: false
    t.integer  "live_build_id"
  end

  add_index "front_end_builds_apps", ["api_key"], name: "index_front_end_builds_apps_on_api_key", using: :btree
  add_index "front_end_builds_apps", ["name"], name: "index_front_end_builds_apps_on_name", using: :btree

  create_table "front_end_builds_builds", force: true do |t|
    t.integer  "app_id"
    t.string   "sha"
    t.string   "job"
    t.string   "branch"
    t.text     "html"
    t.boolean  "fetched",                 default: false
    t.boolean  "active",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "endpoint",   limit: 2038
  end

  add_index "front_end_builds_builds", ["active"], name: "index_front_end_builds_builds_on_active", using: :btree
  add_index "front_end_builds_builds", ["app_id", "branch"], name: "index_front_end_builds_builds_on_app_id_and_branch", using: :btree
  add_index "front_end_builds_builds", ["app_id", "job"], name: "index_front_end_builds_builds_on_app_id_and_job", using: :btree
  add_index "front_end_builds_builds", ["app_id", "sha"], name: "index_front_end_builds_builds_on_app_id_and_sha", using: :btree
  add_index "front_end_builds_builds", ["created_at"], name: "index_front_end_builds_builds_on_created_at", using: :btree
  add_index "front_end_builds_builds", ["fetched"], name: "index_front_end_builds_builds_on_fetched", using: :btree

  create_table "markers", force: true do |t|
    t.string   "lat"
    t.string   "lng"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "time_without_traffic"
  end

  add_index "markers", ["city_id"], name: "index_markers_on_city_id", using: :btree

  create_table "points", force: true do |t|
    t.string   "lat"
    t.string   "lng"
    t.integer  "polyline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "points", ["polyline_id"], name: "index_points_on_polyline_id", using: :btree

  create_table "polylines", force: true do |t|
    t.integer  "marker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "polylines", ["marker_id"], name: "index_polylines_on_marker_id", using: :btree

  create_table "samples", force: true do |t|
    t.string   "time"
    t.integer  "marker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "traffic_load", default: 100
  end

  add_index "samples", ["marker_id"], name: "index_samples_on_marker_id", using: :btree

  create_table "stats", force: true do |t|
    t.string   "average_time_to_center"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "weighted_mean"
  end

  add_index "stats", ["city_id"], name: "index_stats_on_city_id", using: :btree

end
