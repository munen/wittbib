# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120531075521) do

  create_table "books", :force => true do |t|
    t.string   "authors"
    t.string   "title"
    t.string   "isbn_10"
    t.string   "isbn_13"
    t.text     "description"
    t.string   "language"
    t.string   "page_count"
    t.string   "published_date"
    t.string   "publisher"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "image_url"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "phone"
    t.string   "district"
    t.string   "email"
    t.boolean  "is_library_visitor"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "lendings", :force => true do |t|
    t.integer  "book_id"
    t.integer  "customer_id"
    t.datetime "taken_at"
    t.datetime "returned_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
