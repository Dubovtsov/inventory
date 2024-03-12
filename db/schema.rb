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

ActiveRecord::Schema[7.1].define(version: 2024_03_12_091146) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_products", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "invoice_id", null: false
    t.boolean "closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_products_on_invoice_id"
    t.index ["product_id"], name: "index_invoice_products_on_product_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "storehouse_id", null: false
    t.bigint "user_id", null: false
    t.bigint "client_id", null: false
    t.boolean "completed", default: false
    t.string "document_number"
    t.index ["client_id"], name: "index_invoices_on_client_id"
    t.index ["storehouse_id"], name: "index_invoices_on_storehouse_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "prices", force: :cascade do |t|
    t.string "title"
    t.decimal "retail_price"
    t.decimal "purchase_price"
    t.bigint "vendor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_prices_on_vendor_id"
  end

  create_table "product_movements", force: :cascade do |t|
    t.bigint "from_storehouse_id", null: false
    t.bigint "to_storehouse_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.date "date_movement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_product_movements_on_deleted_at"
    t.index ["from_storehouse_id"], name: "index_product_movements_on_from_storehouse_id"
    t.index ["product_id"], name: "index_product_movements_on_product_id"
    t.index ["to_storehouse_id"], name: "index_product_movements_on_to_storehouse_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "serial_number"
    t.string "inventory_number"
    t.date "accepted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "storehouse_id", default: 1, null: false
    t.string "type_product"
    t.bigint "vendor_id"
    t.date "end_date"
    t.boolean "rent", default: false
    t.boolean "shipped", default: false
    t.integer "amount", default: 1
    t.boolean "deleted", default: false
    t.datetime "deleted_at"
    t.bigint "client_id"
    t.decimal "retail_price"
    t.decimal "purchase_price"
    t.boolean "booking", default: false
    t.index ["client_id"], name: "index_products_on_client_id"
    t.index ["deleted_at"], name: "index_products_on_deleted_at"
    t.index ["storehouse_id"], name: "index_products_on_storehouse_id"
    t.index ["vendor_id"], name: "index_products_on_vendor_id"
  end

  create_table "storehouses", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.boolean "employee", default: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_storehouses_on_deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "title"
    t.string "manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "invoice_products", "invoices"
  add_foreign_key "invoice_products", "products"
  add_foreign_key "invoices", "clients"
  add_foreign_key "invoices", "storehouses"
  add_foreign_key "invoices", "users"
  add_foreign_key "prices", "vendors"
  add_foreign_key "product_movements", "products"
  add_foreign_key "product_movements", "storehouses", column: "from_storehouse_id"
  add_foreign_key "product_movements", "storehouses", column: "to_storehouse_id"
  add_foreign_key "products", "clients"
  add_foreign_key "products", "storehouses"
  add_foreign_key "products", "vendors"
end
