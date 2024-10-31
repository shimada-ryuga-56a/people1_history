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

ActiveRecord::Schema[7.2].define(version: 2024_10_30_060252) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "likes_on_song_informations", force: :cascade do |t|
    t.integer "information_id", null: false
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

  create_table "setlistitems", force: :cascade do |t|
    t.integer "song_id"
    t.text "song_title", null: false
    t.integer "position", null: false
    t.boolean "is_encore", default: false, null: false
    t.boolean "is_song", default: true, null: false
    t.boolean "is_arranged", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "setlist_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "event_informations", "events"
  add_foreign_key "event_informations", "users"
  add_foreign_key "events", "tours"
  add_foreign_key "tour_informations", "tours"
  add_foreign_key "tour_informations", "users"
end
