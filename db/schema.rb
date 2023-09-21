# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_20_132343) do
  create_table "trips", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.integer "assignee_id", null: false
    t.integer "status", default: 0, null: false
    t.boolean "current_assignment", default: true, null: false
    t.datetime "arrival", null: false
    t.datetime "completion", null: false
    t.datetime "checkin"
    t.datetime "checkout"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignee_id"], name: "index_trips_on_assignee_id"
    t.index ["owner_id"], name: "index_trips_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "trips", "users", column: "assignee_id"
  add_foreign_key "trips", "users", column: "owner_id"
end
