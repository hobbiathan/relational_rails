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

ActiveRecord::Schema.define(version: 2021_12_02_123853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.integer "military_power_rank"
    t.string "country_name"
    t.boolean "nuclear_power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warrooms", force: :cascade do |t|
    t.integer "strategic_importance"
    t.string "warroom_name"
    t.boolean "deadman_switch"
    t.boolean "contains_wmd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id"
    t.index ["country_id"], name: "index_warrooms_on_country_id"
  end

  add_foreign_key "warrooms", "countries"
end
