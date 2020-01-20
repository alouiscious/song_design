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

ActiveRecord::Schema.define(version: 2020_01_19_073406) do

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "email"
    t.integer "phone"
    t.string "instrument"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rehearsals", force: :cascade do |t|
    t.string "location"
    t.string "city"
    t.string "purpose"
    t.datetime "date"
    t.datetime "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.integer "musician_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["musician_id"], name: "index_songs_on_musician_id"
    t.index ["rehearsal_id"], name: "index_songs_on_rehearsal_id"
  end

end
