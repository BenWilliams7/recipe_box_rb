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

ActiveRecord::Schema.define(version: 20170510183315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.bigint "recipes_id"
    t.bigint "ingredients_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredients_id"], name: "index_contents_on_ingredients_id"
    t.index ["recipes_id"], name: "index_contents_on_recipes_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructions", force: :cascade do |t|
    t.bigint "recipes_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipes_id"], name: "index_instructions_on_recipes_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "categories_id"
    t.bigint "recipes_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_tags_on_categories_id"
    t.index ["recipes_id"], name: "index_tags_on_recipes_id"
  end

end