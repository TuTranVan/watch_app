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

ActiveRecord::Schema.define(version: 20191219042557) do

  create_table "binhluans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "sanpham_id"
    t.text "noidung"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sanpham_id"], name: "index_binhluans_on_sanpham_id"
    t.index ["user_id"], name: "index_binhluans_on_user_id"
  end

  create_table "chitietdhs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "donhang_id"
    t.bigint "sanpham_id"
    t.integer "soluong", default: 0
    t.integer "dongia", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donhang_id"], name: "index_chitietdhs_on_donhang_id"
    t.index ["sanpham_id"], name: "index_chitietdhs_on_sanpham_id"
  end

  create_table "donhangs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.date "ngaydat"
    t.boolean "diachinhan", default: false
    t.integer "tongtien"
    t.integer "trangthai", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "magh"
    t.index ["user_id"], name: "index_donhangs_on_user_id"
  end

  create_table "loaisps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ten"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nguoinhans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "donhang_id"
    t.string "hoten"
    t.string "diachi"
    t.string "sdt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donhang_id"], name: "index_nguoinhans_on_donhang_id"
  end

  create_table "nhaphangs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "sanpham_id"
    t.integer "soluong"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sanpham_id"], name: "index_nhaphangs_on_sanpham_id"
    t.index ["user_id"], name: "index_nhaphangs_on_user_id"
  end

  create_table "sanphams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "loaisp_id"
    t.string "ten"
    t.string "mausac"
    t.string "thuonghieu"
    t.string "xuatsu"
    t.string "baohanh"
    t.integer "soluong", default: 0, null: false
    t.integer "dongia"
    t.string "hinhanh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loaisp_id"], name: "index_sanphams_on_loaisp_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ten"
    t.string "email"
    t.string "password_digest"
    t.string "diachi"
    t.string "sdt"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "binhluans", "sanphams"
  add_foreign_key "binhluans", "users"
  add_foreign_key "chitietdhs", "donhangs"
  add_foreign_key "chitietdhs", "sanphams"
  add_foreign_key "donhangs", "users"
  add_foreign_key "nguoinhans", "donhangs"
  add_foreign_key "nhaphangs", "sanphams"
  add_foreign_key "nhaphangs", "users"
  add_foreign_key "sanphams", "loaisps"
end
