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

ActiveRecord::Schema.define(version: 20180608181031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comanagers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer "user_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_organizations_on_owner_id"
  end

  create_table "timebooks", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "timecard_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timecards", force: :cascade do |t|
    t.float "sat_hours", default: 0.0
    t.integer "sat_break_hours", default: 0
    t.boolean "sat_break_hours_is_set", default: false
    t.integer "sat_break_minutes", default: 0
    t.boolean "sat_break_minutes_is_set", default: false
    t.datetime "sat_start"
    t.boolean "sat_start_is_set", default: false
    t.datetime "sat_end"
    t.boolean "sat_end_is_set", default: false
    t.float "sun_hours", default: 0.0
    t.integer "sun_break_hours", default: 0
    t.boolean "sun_break_hours_is_set", default: false
    t.integer "sun_break_minutes", default: 0
    t.boolean "sun_break_minutes_is_set", default: false
    t.datetime "sun_start"
    t.boolean "sun_start_is_set", default: false
    t.datetime "sun_end"
    t.boolean "sun_end_is_set", default: false
    t.float "mon_hours", default: 0.0
    t.integer "mon_break_hours", default: 0
    t.boolean "mon_break_hours_is_set", default: false
    t.integer "mon_break_minutes", default: 0
    t.boolean "mon_break_minutes_is_set", default: false
    t.datetime "mon_start"
    t.boolean "mon_start_is_set", default: false
    t.datetime "mon_end"
    t.boolean "mon_end_is_set", default: false
    t.float "tue_hours", default: 0.0
    t.integer "tue_break_hours", default: 0
    t.boolean "tue_break_hours_is_set", default: false
    t.integer "tue_break_minutes", default: 0
    t.boolean "tue_break_minutes_is_set", default: false
    t.datetime "tue_start"
    t.boolean "tue_start_is_set", default: false
    t.datetime "tue_end"
    t.boolean "tue_end_is_set", default: false
    t.float "wed_hours", default: 0.0
    t.integer "wed_break_hours", default: 0
    t.boolean "wed_break_hours_is_set", default: false
    t.integer "wed_break_minutes", default: 0
    t.boolean "wed_break_minutes_is_set", default: false
    t.datetime "wed_start"
    t.boolean "wed_start_is_set", default: false
    t.datetime "wed_end"
    t.boolean "wed_end_is_set", default: false
    t.float "thu_hours", default: 0.0
    t.integer "thu_break_hours", default: 0
    t.boolean "thu_break_hours_is_set", default: false
    t.integer "thu_break_minutes", default: 0
    t.boolean "thu_break_minutes_is_set", default: false
    t.datetime "thu_start"
    t.boolean "thu_start_is_set", default: false
    t.datetime "thu_end"
    t.boolean "thu_end_is_set", default: false
    t.float "fri_hours", default: 0.0
    t.integer "fri_break_hours", default: 0
    t.boolean "fri_break_hours_is_set", default: false
    t.integer "fri_break_minutes", default: 0
    t.boolean "fri_break_minutes_is_set", default: false
    t.datetime "fri_start"
    t.boolean "fri_start_is_set", default: false
    t.datetime "fri_end"
    t.boolean "fri_end_is_set", default: false
    t.float "overtime_hours", default: 0.0
    t.datetime "end_date"
    t.string "stephens_quote"
    t.float "total_hours", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sick_hours", default: 0
    t.boolean "active", default: false
    t.boolean "locked", default: false
    t.float "sat_overtime", default: 0.0
    t.float "sun_overtime", default: 0.0
    t.float "mon_overtime", default: 0.0
    t.float "tue_overtime", default: 0.0
    t.float "wed_overtime", default: 0.0
    t.float "thu_overtime", default: 0.0
    t.float "fri_overtime", default: 0.0
    t.float "double_overtime", default: 0.0
    t.float "sat_double_overtime", default: 0.0
    t.float "sun_double_overtime", default: 0.0
    t.float "mon_double_overtime", default: 0.0
    t.float "tue_double_overtime", default: 0.0
    t.float "wed_double_overtime", default: 0.0
    t.float "thu_double_overtime", default: 0.0
    t.float "fri_double_overtime", default: 0.0
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.integer "admin_level"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean "needs_to_update_account", default: false
    t.string "user_image_link", default: ""
    t.boolean "disabled", default: false
    t.string "f_name", default: ""
    t.string "l_name", default: ""
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
