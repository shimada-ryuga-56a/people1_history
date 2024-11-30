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

ActiveRecord::Schema[8.0].define(version: 2024_11_30_152020) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

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

  create_table "disc_contents", force: :cascade do |t|
    t.integer "disc_version_id", null: false
    t.integer "content_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
  end

  create_table "disc_items", force: :cascade do |t|
    t.integer "disc_content_id", null: false
    t.integer "position", null: false
    t.integer "song_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_arranged", default: false, null: false
  end

  create_table "disc_versions", force: :cascade do |t|
    t.integer "disc_id", null: false
    t.integer "version", null: false
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.string "title", null: false
    t.string "title_ruby", null: false
    t.date "announcement_date", null: false
    t.date "release_date"
    t.integer "production_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_informations", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_informations_on_event_id"
    t.index ["user_id"], name: "index_event_informations_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "category"
    t.text "name"
    t.text "name_kana_ruby"
    t.date "date"
    t.text "place"
    t.integer "place_prefecture"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tour_id"
    t.boolean "is_canceled", default: false, null: false
    t.index ["tour_id"], name: "index_events_on_tour_id"
  end

  create_table "likes_on_event_informations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_information_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes_on_setlistitem_informations", force: :cascade do |t|
    t.integer "setlistitem_information_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes_on_song_informations", force: :cascade do |t|
    t.integer "song_information_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes_on_tour_informations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tour_information_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.integer "from_whom_id"
    t.string "noticeable_type"
    t.bigint "noticeable_id"
    t.integer "action_type", null: false
    t.boolean "unread", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["noticeable_type", "noticeable_id"], name: "index_notices_on_noticeable"
  end

  create_table "setlist_informations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "setlistitem_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "setlistitem_informations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "setlistitem_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "setlistitems", force: :cascade do |t|
    t.integer "song_id"
    t.text "song_title", null: false
    t.boolean "is_encore", default: false, null: false
    t.boolean "is_song", default: true, null: false
    t.boolean "is_arranged", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "setlist_id"
    t.boolean "is_rehearsal", default: false, null: false
  end

  create_table "setlists", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "song_informations", force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "user_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana_ruby", null: false
    t.text "youtube_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_hiragana_ruby"
  end

  create_table "tour_informations", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "user_id"
    t.bigint "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_tour_informations_on_tour_id"
    t.index ["user_id"], name: "index_tour_informations_on_user_id"
  end

  create_table "tours", force: :cascade do |t|
    t.text "name"
    t.text "name_kana_ruby"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
    t.string "name"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "event_informations", "events"
  add_foreign_key "event_informations", "users"
  add_foreign_key "events", "tours"
  add_foreign_key "tour_informations", "tours"
  add_foreign_key "tour_informations", "users"
end
