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

ActiveRecord::Schema[8.0].define(version: 2025_01_27_020555) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bank_accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "pin_digest"
    t.string "pin_confirmation"
    t.decimal "balance", default: "0.0"
    t.string "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_type", default: 0
    t.string "email", null: false
    t.index ["account_id"], name: "index_bank_accounts_on_account_id", unique: true
  end

  create_table "bank_transactions", force: :cascade do |t|
    t.integer "transaction_type", null: false
    t.decimal "amount", null: false
    t.integer "source_account_id", null: false
    t.integer "destination_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "bank_fee"
  end
end
