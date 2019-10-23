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

ActiveRecord::Schema.define(version: 2019_10_23_205018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.bigint "prompt_id", null: false
    t.string "uuid"
    t.bigint "winner_id"
    t.string "player_one"
    t.string "player_two"
    t.string "player_three"
    t.string "player_four"
    t.integer "player_one_progress"
    t.integer "player_two_progress"
    t.integer "player_three_progress"
    t.integer "player_four_progress"
    t.float "player_one_wpm"
    t.float "player_two_wpm"
    t.float "player_three_wpm"
    t.float "player_four_wpm"
    t.string "winner_name"
    t.index ["prompt_id"], name: "index_challenges_on_prompt_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.text "text"
    t.integer "length"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_challenges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "challenge_id", null: false
    t.float "wpm"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["challenge_id"], name: "index_user_challenges_on_challenge_id"
    t.index ["user_id"], name: "index_user_challenges_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "img_url", default: "https://www.pinclipart.com/picdir/middle/8-82428_profile-clipart-generic-user-gender-neutral-head-icon.png"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "challenges", "prompts"
  add_foreign_key "user_challenges", "challenges"
  add_foreign_key "user_challenges", "users"
end
