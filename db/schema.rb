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

ActiveRecord::Schema.define(version: 20200310204320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_services", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.integer  "customers_package_id"
    t.integer  "customers_additional_service_id"
    t.integer  "month_bill_id",                   null: false
    t.float    "amount"
    t.date     "due_date"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["customers_additional_service_id"], name: "index_bills_on_customers_additional_service_id", using: :btree
    t.index ["customers_package_id"], name: "index_bills_on_customers_package_id", using: :btree
    t.index ["month_bill_id"], name: "index_bills_on_month_bill_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf",        limit: 11
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "customers_additional_services", force: :cascade do |t|
    t.integer  "customer_id",           null: false
    t.integer  "additional_service_id", null: false
    t.float    "price"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["additional_service_id"], name: "index_customers_additional_services_on_additional_service_id", using: :btree
    t.index ["customer_id"], name: "index_customers_additional_services_on_customer_id", using: :btree
  end

  create_table "customers_packages", force: :cascade do |t|
    t.integer  "customer_id", null: false
    t.integer  "package_id",  null: false
    t.float    "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_customers_packages_on_customer_id", using: :btree
    t.index ["package_id"], name: "index_customers_packages_on_package_id", using: :btree
  end

  create_table "month_bills", force: :cascade do |t|
    t.integer  "year_bill_id"
    t.float    "total_sum"
    t.date     "due_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["year_bill_id"], name: "index_month_bills_on_year_bill_id", using: :btree
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "year_bills", force: :cascade do |t|
    t.integer  "customer_id"
    t.date     "init_date"
    t.date     "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_year_bills_on_customer_id", using: :btree
  end

  add_foreign_key "bills", "customers_additional_services"
  add_foreign_key "bills", "customers_packages"
  add_foreign_key "bills", "month_bills"
  add_foreign_key "customers_additional_services", "additional_services"
  add_foreign_key "customers_additional_services", "customers"
  add_foreign_key "customers_packages", "customers"
  add_foreign_key "customers_packages", "packages"
  add_foreign_key "month_bills", "year_bills"
  add_foreign_key "year_bills", "customers"
end
