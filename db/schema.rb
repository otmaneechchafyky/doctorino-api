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

ActiveRecord::Schema[7.0].define(version: 2024_01_20_001856) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "animal_photo"
    t.date "date_of_birth"
    t.decimal "weight"
    t.integer "escape_attempts"
    t.bigint "owner_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_animals_on_genre_id"
    t.index ["owner_id"], name: "index_animals_on_owner_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.string "location"
    t.decimal "duration"
    t.bigint "animal_id", null: false
    t.bigint "vet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_appointments_on_animal_id"
    t.index ["vet_id"], name: "index_appointments_on_vet_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specializations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "userName", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "profile_image", default: "icons/user_icon.png"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vets", force: :cascade do |t|
    t.string "name"
    t.string "vet_photo"
    t.time "available_from"
    t.time "available_to"
    t.decimal "fees"
    t.text "bio"
    t.bigint "specialization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specialization_id"], name: "index_vets_on_specialization_id"
  end

  add_foreign_key "animals", "genres"
  add_foreign_key "animals", "users", column: "owner_id"
  add_foreign_key "appointments", "animals"
  add_foreign_key "appointments", "vets"
  add_foreign_key "vets", "specializations"
end
