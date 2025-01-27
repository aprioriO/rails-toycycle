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

ActiveRecord::Schema[7.1].define(version: 2025_01_27_175558) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "toy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["toy_id"], name: "index_reviews_on_toy_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "toys", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "category"
    t.string "description"
    t.string "condition"
    t.string "status"
    t.string "need_in_return"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_toys_on_user_id"
  end

  create_table "trades", force: :cascade do |t|
    t.bigint "toy_seeker_id"
    t.bigint "toy_trader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["toy_seeker_id"], name: "index_trades_on_toy_seeker_id"
    t.index ["toy_trader_id"], name: "index_trades_on_toy_trader_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watchlists", force: :cascade do |t|
    t.bigint "toy_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["toy_id"], name: "index_watchlists_on_toy_id"
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "reviews", "toys"
  add_foreign_key "reviews", "users"
  add_foreign_key "toys", "users"
  add_foreign_key "trades", "toys", column: "toy_seeker_id"
  add_foreign_key "trades", "toys", column: "toy_trader_id"
  add_foreign_key "watchlists", "toys"
  add_foreign_key "watchlists", "users"
end
