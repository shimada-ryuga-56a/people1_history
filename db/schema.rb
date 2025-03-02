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

ActiveRecord::Schema[8.0].define(version: 2025_02_20_020407) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

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

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "disc_contents", force: :cascade do |t|
    t.integer "disc_version_id", null: false
    t.integer "content_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
  end

  create_table "disc_dates", force: :cascade do |t|
    t.date "date", null: false
    t.integer "disc_id", null: false
    t.integer "date_type", null: false
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.date "announcement_date"
    t.date "release_date"
    t.integer "production_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_bookmarks", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id", null: false
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
    t.date "date", null: false
    t.text "place"
    t.integer "place_prefecture"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tour_id"
    t.boolean "is_canceled", default: false, null: false
    t.index ["tour_id"], name: "index_events_on_tour_id"
  end

  create_table "gears", force: :cascade do |t|
    t.integer "instrument_id", null: false
    t.string "name", null: false
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.text "title", null: false
    t.integer "user_id", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "remark"
  end

  create_table "information", force: :cascade do |t|
    t.string "reportable_type"
    t.bigint "reportable_id"
    t.string "body", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "informations", force: :cascade do |t|
    t.string "reportable_type"
    t.bigint "reportable_id"
    t.string "body", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reportable_type", "reportable_id"], name: "index_information_on_reportable"
  end

  create_table "instruments", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "likable_type", null: false
    t.bigint "likable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likable_type", "likable_id"], name: "index_likes_on_likable"
  end

  create_table "likes_on_event_informations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_information_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes_on_informations", force: :cascade do |t|
    t.integer "information_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes_on_member_infos", force: :cascade do |t|
    t.integer "member_information_id", null: false
    t.integer "user_id", null: false
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

  create_table "link_contents", force: :cascade do |t|
    t.integer "link_id", null: false
    t.string "linkable_type"
    t.bigint "linkable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["linkable_type", "linkable_id"], name: "index_link_contents_on_linkable"
  end

  create_table "link_dates", force: :cascade do |t|
    t.date "date", null: false
    t.integer "link_id", null: false
    t.integer "date_type", null: false
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "link_view_counts", force: :cascade do |t|
    t.integer "link_id", null: false
    t.date "date", null: false
    t.integer "view_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "link_views", force: :cascade do |t|
    t.integer "link_id", null: false
    t.date "date", null: false
    t.integer "record_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.integer "platform", null: false
    t.text "url_link", null: false
    t.string "remark", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", default: "title"
  end

  create_table "member_informations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_ruby", null: false
    t.text "x_link"
    t.text "instagram"
    t.text "thread"
    t.integer "role", null: false
    t.integer "birthday_year"
    t.integer "birthday_month"
    t.integer "birthday_day"
    t.integer "blood_type"
    t.integer "mbti"
    t.integer "birth_place"
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
    t.date "announcement_date"
  end

  create_table "tie_ups", force: :cascade do |t|
    t.string "collaboration_title", null: false
    t.integer "song_id", null: false
    t.date "announcement_date", null: false
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_new_song", default: true, null: false
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

  add_foreign_key "tour_informations", "tours"
  add_foreign_key "tour_informations", "users"
end
