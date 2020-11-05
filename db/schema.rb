# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_03_192408) do

  create_table "portfolios", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stock_id"
    t.decimal "investing"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.decimal "value"
    t.decimal "open"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "watch_list_id"
    t.index ["watch_list_id"], name: "index_stocks_on_watch_list_id"
  end

  create_table "stocks_watch_lists", id: false, force: :cascade do |t|
    t.integer "watch_list_id", null: false
    t.integer "stock_id", null: false
    t.index ["stock_id", "watch_list_id"], name: "index_stocks_watch_lists_on_stock_id_and_watch_list_id"
    t.index ["watch_list_id", "stock_id"], name: "index_stocks_watch_lists_on_watch_list_id_and_stock_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
  end

  create_table "watch_lists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stock_id"
    t.string "list_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
