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

ActiveRecord::Schema.define(version: 20170116151651) do

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.integer  "activity_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "album_artists", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "album_songs", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "views"
    t.float    "avg_rates"
    t.integer  "album_type"
    t.integer  "avatar"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "artist_songs", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar"
    t.date     "date_of_birth"
    t.integer  "type_of_music"
    t.integer  "artist_type"
    t.datetime "deleted_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "category_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "category_desc_idx"
  end

  create_table "comment_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "comment_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "comment_desc_idx"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.integer  "user_id"
    t.text     "content"
    t.integer  "parent_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.integer  "favouritable_id"
    t.integer  "favouritable_type"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "lyrics", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.text     "content"
    t.integer  "status"
    t.boolean  "is_approve"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "overall_averages", force: :cascade do |t|
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
    t.index ["rater_id"], name: "index_rates_on_rater_id"
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string   "cacheable_type"
    t.integer  "cacheable_id"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.integer  "album_id"
    t.integer  "category_id"
    t.integer  "views_count"
    t.float    "avg_rates"
    t.boolean  "is_pin"
    t.string   "url_content"
    t.integer  "composer_id"
    t.integer  "singer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_admin",               default: false
    t.datetime "deleted_at"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
