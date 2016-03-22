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

ActiveRecord::Schema.define(version: 20160319233420) do

  create_table "clients", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.string   "login",      limit: 30
    t.string   "password"
    t.string   "email"
    t.string   "cpf"
    t.string   "rg"
    t.datetime "createDate"
    t.datetime "updateDate"
    t.text     "comments"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "clients", ["cpf"], name: "index_clients_on_cpf", unique: true

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 50
    t.text     "description"
    t.decimal  "value",                  precision: 10, scale: 2
    t.integer  "quantity"
    t.decimal  "discount",               precision: 10, scale: 2
    t.decimal  "profit",                 precision: 10, scale: 2
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "purchase_historics", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "createDate"
    t.boolean  "paidStatus"
    t.decimal  "discount",      precision: 10, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.decimal  "value_of_sell"
  end

  add_index "purchase_historics", ["client_id"], name: "index_purchase_historics_on_client_id"
  add_index "purchase_historics", ["product_id"], name: "index_purchase_historics_on_product_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.string   "login",      limit: 30
    t.string   "password"
    t.string   "email"
    t.string   "cpf"
    t.string   "rg"
    t.datetime "createDate"
    t.datetime "updateDate"
    t.text     "comments"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "users", ["cpf"], name: "index_users_on_cpf", unique: true

end
