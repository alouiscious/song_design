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

ActiveRecord::Schema.define(version: 2020_01_29_034427) do

  create_table "rehearsals", force: :cascade do |t|
    t.string "location"
    t.string "city"
    t.string "purpose"
    t.datetime "date"
    t.datetime "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organizer_id"
  end

  create_table "song_notes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "type"
    t.integer "song_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["song_id"], name: "index_song_notes_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.string "key"
    t.string "in_style_of"
    t.boolean "status"
    t.integer "rehearsal_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rehearsal_id"], name: "index_songs_on_rehearsal_id"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "user_rehearsals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "rehearsal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rehearsal_id"], name: "index_user_rehearsals_on_rehearsal_id"
    t.index ["user_id"], name: "index_user_rehearsals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "phone"
    t.string "instrument"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "user_rehearsals", "rehearsals"
  add_foreign_key "user_rehearsals", "users"
end
