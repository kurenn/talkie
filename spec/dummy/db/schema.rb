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

ActiveRecord::Schema.define(version: 2019_05_27_182237) do

  create_table "dummy_commentables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dummy_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talkie_comments", force: :cascade do |t|
    t.string "creator_type"
    t.integer "creator_id"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.text "body", null: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "children_count", default: 0
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id"], name: "index_talkie_comments_on_commentable_id"
    t.index ["commentable_type"], name: "index_talkie_comments_on_commentable_type"
    t.index ["creator_id", "creator_type"], name: "index_talkie_comments_on_creator_id_and_creator_type"
  end

end
