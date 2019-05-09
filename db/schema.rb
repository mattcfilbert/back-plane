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

ActiveRecord::Schema.define(version: 2019_05_07_180818) do

  create_table "part_operations", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.integer "part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_part_operations_on_part_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "number"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "production_operations", force: :cascade do |t|
    t.boolean "complete"
    t.date "complete_date"
    t.string "produceable_type"
    t.integer "produceable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produceable_type", "produceable_id"], name: "produceable_index"
  end

  create_table "work_order_lines", force: :cascade do |t|
    t.integer "quantity"
    t.date "created_date"
    t.boolean "released"
    t.date "released_date"
    t.boolean "complete"
    t.date "complete_date"
    t.string "workable_type"
    t.integer "workable_id"
    t.string "part_key"
    t.string "work_order_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workable_type", "workable_id"], name: "workable_index"
  end

  create_table "work_orders", force: :cascade do |t|
    t.string "work_order_number"
    t.string "customer"
    t.string "customer_order_number"
    t.date "due_date"
    t.string "status"
    t.date "completed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
