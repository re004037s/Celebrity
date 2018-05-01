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

ActiveRecord::Schema.define(version: 20180430134700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.binary   "thumbnail"
    t.string   "thumbnail_name"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_page_id"
    t.index ["user_id", "created_at"], name: "index_comments_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "feedback"
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feedbacks_on_user_id", using: :btree
  end

  create_table "html_css_statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "ga_beginner",            default: false
    t.boolean  "ga_middle",              default: false
    t.boolean  "ga_advanced",            default: false
    t.boolean  "do_beginner",            default: false
    t.boolean  "do_middle",              default: false
    t.boolean  "do_advanced",            default: false
    t.boolean  "ji_1",                   default: false
    t.boolean  "ji_2",                   default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.date     "ga_beginner_compd"
    t.date     "ga_middle_compd"
    t.date     "ga_advanced_compd"
    t.date     "do_beginner_compd"
    t.date     "do_middle_compd"
    t.date     "do_advanced_compd"
    t.date     "ji_1_compd"
    t.date     "ji_2_compd"
    t.date     "schedule_date"
    t.date     "ga_beginner_completion"
    t.date     "ga_middle_completion"
    t.date     "ga_advanced_completion"
    t.date     "do_beginner_completion"
    t.date     "do_middle_completion"
    t.date     "do_advanced_completion"
    t.date     "ji_1_completion"
    t.date     "ji_2_completion"
    t.index ["user_id"], name: "index_html_css_statuses_on_user_id", using: :btree
  end

  create_table "information", force: :cascade do |t|
    t.text     "info"
    t.date     "display_period"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "interview_posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "language"
    t.string   "experience"
    t.string   "type"
    t.date     "day"
    t.text     "summary"
    t.text     "question"
    t.string   "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_interview_posts_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_interview_posts_on_user_id", using: :btree
  end

  create_table "javascript_statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.date     "schedule_date"
    t.boolean  "ga_1",            default: false
    t.boolean  "ga_2",            default: false
    t.boolean  "ga_3",            default: false
    t.boolean  "ga_4",            default: false
    t.boolean  "do_1",            default: false
    t.date     "ga_1_compd"
    t.date     "ga_2_compd"
    t.date     "ga_3_compd"
    t.date     "ga_4_compd"
    t.date     "do_1_compd"
    t.date     "ga_1_completion"
    t.date     "ga_2_completion"
    t.date     "ga_3_completion"
    t.date     "ga_4_completion"
    t.date     "do_1_completion"
    t.index ["user_id"], name: "index_javascript_statuses_on_user_id", using: :btree
  end

  create_table "movie_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "sort_order"
    t.boolean  "must_view",  default: false
    t.string   "subject"
    t.index ["deleted_at"], name: "index_movie_categories_on_deleted_at", using: :btree
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "path"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.datetime "deleted_at"
    t.integer  "movie_category_id"
    t.integer  "sort_order"
    t.index ["deleted_at"], name: "index_movies_on_deleted_at", using: :btree
    t.index ["movie_category_id"], name: "index_movies_on_movie_category_id", using: :btree
  end

  create_table "pdca_posts", force: :cascade do |t|
    t.text     "plan"
    t.text     "do"
    t.text     "check"
    t.text     "action"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
    t.index ["user_id", "created_at"], name: "index_pdca_posts_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_pdca_posts_on_user_id", using: :btree
  end

  create_table "qiita_posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_qiita_posts_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_qiita_posts_on_user_id", using: :btree
  end

  create_table "railstutorial_statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "chapter1",        default: false
    t.boolean  "chapter2",        default: false
    t.boolean  "chapter3",        default: false
    t.boolean  "chapter4",        default: false
    t.boolean  "chapter5",        default: false
    t.boolean  "chapter6",        default: false
    t.boolean  "chapter7",        default: false
    t.boolean  "chapter8",        default: false
    t.boolean  "chapter9",        default: false
    t.boolean  "chapter10",       default: false
    t.boolean  "chapter11",       default: false
    t.boolean  "chapter12",       default: false
    t.boolean  "chapter13",       default: false
    t.boolean  "chapter14",       default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.date     "chapter1_compd"
    t.date     "chapter2_compd"
    t.date     "chapter3_compd"
    t.date     "chapter4_compd"
    t.date     "chapter5_compd"
    t.date     "chapter6_compd"
    t.date     "chapter7_compd"
    t.date     "chapter8_compd"
    t.date     "chapter9_compd"
    t.date     "chapter10_compd"
    t.date     "chapter11_compd"
    t.date     "chapter12_compd"
    t.date     "chapter13_compd"
    t.date     "chapter14_compd"
    t.date     "schedule_date"
    t.index ["user_id"], name: "index_railstutorial_statuses_on_user_id", using: :btree
  end

  create_table "ruby_statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "ga_1",            default: false
    t.boolean  "ga_2",            default: false
    t.boolean  "ga_3",            default: false
    t.boolean  "ga_4",            default: false
    t.boolean  "ga_5",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.date     "ga_1_compd"
    t.date     "ga_2_compd"
    t.date     "ga_3_compd"
    t.date     "ga_4_compd"
    t.date     "ga_5_compd"
    t.date     "schedule_date"
    t.date     "ga_1_completion"
    t.date     "ga_2_completion"
    t.date     "ga_3_completion"
    t.date     "ga_4_completion"
    t.date     "ga_5_completion"
    t.index ["user_id"], name: "index_ruby_statuses_on_user_id", using: :btree
  end

  create_table "rubyonrails_statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "ga_1",             default: false
    t.boolean  "ga_2",             default: false
    t.boolean  "ga_3",             default: false
    t.boolean  "ga_4",             default: false
    t.boolean  "ga_5",             default: false
    t.boolean  "ga_6",             default: false
    t.boolean  "ga_7",             default: false
    t.boolean  "ga_8",             default: false
    t.boolean  "ga_9",             default: false
    t.boolean  "ga_10",            default: false
    t.boolean  "ga_11",            default: false
    t.boolean  "do_1",             default: false
    t.boolean  "do_2",             default: false
    t.boolean  "do_3",             default: false
    t.boolean  "do_4",             default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.date     "ga_1_compd"
    t.date     "ga_2_compd"
    t.date     "ga_3_compd"
    t.date     "ga_4_compd"
    t.date     "ga_5_compd"
    t.date     "ga_6_compd"
    t.date     "ga_7_compd"
    t.date     "ga_8_compd"
    t.date     "ga_9_compd"
    t.date     "ga_10_compd"
    t.date     "ga_11_compd"
    t.date     "do_1_compd"
    t.date     "do_2_compd"
    t.date     "do_3_compd"
    t.date     "do_4_compd"
    t.date     "schedule_date"
    t.date     "ga_1_completion"
    t.date     "ga_2_completion"
    t.date     "ga_3_completion"
    t.date     "ga_4_completion"
    t.date     "ga_5_completion"
    t.date     "ga_6_completion"
    t.date     "ga_7_completion"
    t.date     "ga_8_completion"
    t.date     "ga_9_completion"
    t.date     "ga_10_completion"
    t.date     "ga_11_completion"
    t.date     "do_1_completion"
    t.date     "do_2_completion"
    t.date     "do_3_completion"
    t.date     "do_4_completion"
    t.index ["user_id"], name: "index_rubyonrails_statuses_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.text     "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms", force: :cascade do |t|
    t.string   "name"
    t.string   "content"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.integer  "create_user_id", default: 0, null: false
    t.index ["create_user_id"], name: "index_terms_on_create_user_id", using: :btree
    t.index ["user_id"], name: "index_terms_on_user_id", using: :btree
  end

  create_table "user_movie_statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "schedule_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_user_movie_statuses_on_user_id", using: :btree
  end

  create_table "user_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_user_tags_on_tag_id", using: :btree
    t.index ["user_id"], name: "index_user_tags_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "admin",              default: false
    t.boolean  "existence",          default: true
    t.string   "portfolio_path"
    t.string   "github_path"
    t.binary   "picture_file"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "line_id"
    t.binary   "skillsheet"
    t.string   "skillsheet_name",    default: "未登録"
    t.string   "status",             default: "未登録"
    t.boolean  "guest",              default: false
    t.boolean  "venture_user",       default: false, null: false
    t.boolean  "free_engineer_user", default: true,  null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "comments", "users"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "interview_posts", "users"
  add_foreign_key "movies", "movie_categories"
  add_foreign_key "pdca_posts", "users"
  add_foreign_key "qiita_posts", "users"
  add_foreign_key "terms", "users"
  add_foreign_key "user_tags", "tags"
  add_foreign_key "user_tags", "users"
end
