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

ActiveRecord::Schema.define(version: 20190331014504) do

  create_table "causes", force: :cascade do |t|
    t.integer  "element_id"
    t.string   "title"
    t.string   "image_large_top"
    t.string   "image_description"
    t.string   "image_important"
    t.string   "image_disaster"
    t.string   "image_large_bottom"
    t.string   "image_plan"
    t.string   "image_product"
    t.text     "mini_description"
    t.text     "description"
    t.text     "important"
    t.text     "disaster"
    t.text     "plan"
    t.string   "raised"
    t.string   "slug"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["element_id"], name: "index_causes_on_element_id"
  end

  create_table "elements", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.string   "color"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "cause_id"
    t.string   "title"
    t.text     "description"
    t.text     "mini_description"
    t.integer  "base_price"
    t.integer  "shipping_price"
    t.integer  "total_price"
    t.integer  "quantity"
    t.text     "element_text"
    t.string   "element_image"
    t.text     "cause_text"
    t.string   "cause_large_image"
    t.string   "cause_small_image"
    t.string   "amount_to_product"
    t.string   "product_plus1"
    t.string   "product_plus2"
    t.string   "product_plus3"
    t.string   "product_other"
    t.string   "amount_to_cause"
    t.string   "cause_plus1"
    t.string   "cause_plus2"
    t.string   "cause_plus3"
    t.string   "cause_other"
    t.string   "amount_to_company"
    t.string   "company_plus1"
    t.string   "company_plus2"
    t.string   "company_plus3"
    t.string   "company_other"
    t.string   "color"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.boolean  "on_sale",           default: true
    t.string   "slug"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["cause_id"], name: "index_products_on_cause_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "username",               default: "", null: false
    t.string   "slug",                   default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
