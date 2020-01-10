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

ActiveRecord::Schema.define(version: 20200110112347) do

  create_table "binhluans", primary_key: "mabl", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "mand"
    t.string "masp"
    t.text "noidung"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mand"], name: "fk_rails_8ab7fedfaf"
    t.index ["masp"], name: "fk_rails_f9e53a6a50"
  end

  create_table "chitietdhs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "madh"
    t.string "masp"
    t.integer "soluong", default: 0
    t.integer "dongia", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["madh"], name: "fk_rails_759948e70e"
    t.index ["masp"], name: "fk_rails_e2c082103b"
  end

  create_table "donhangs", primary_key: "madh", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "mand"
    t.date "ngaydat"
    t.boolean "diachinhan", default: false
    t.integer "tongtien"
    t.integer "trangthai", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "magh"
    t.index ["magh"], name: "fk_rails_665871974a"
    t.index ["mand"], name: "fk_rails_e21c4a6e97"
  end

  create_table "loaisps", primary_key: "maloai", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ten"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nguoidungs", primary_key: "mand", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ten"
    t.string "email"
    t.string "password_digest"
    t.string "diachi"
    t.string "sdt"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nguoinhans", primary_key: "mann", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "madh"
    t.string "hoten"
    t.string "diachi"
    t.string "sdt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["madh"], name: "fk_rails_ff5497889f"
  end

  create_table "nhaphangs", primary_key: "manh", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "mand"
    t.string "masp"
    t.integer "soluong"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mand"], name: "fk_rails_a6e8e95c0e"
    t.index ["masp"], name: "fk_rails_33ab2c6920"
  end

  create_table "sanphams", primary_key: "masp", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "maloai"
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
    t.index ["maloai"], name: "fk_rails_011412d32e"
  end

  add_foreign_key "binhluans", "nguoidungs", column: "mand", primary_key: "mand"
  add_foreign_key "binhluans", "sanphams", column: "masp", primary_key: "masp"
  add_foreign_key "chitietdhs", "donhangs", column: "madh", primary_key: "madh"
  add_foreign_key "chitietdhs", "sanphams", column: "masp", primary_key: "masp"
  add_foreign_key "donhangs", "nguoidungs", column: "magh", primary_key: "mand"
  add_foreign_key "donhangs", "nguoidungs", column: "mand", primary_key: "mand"
  add_foreign_key "nguoinhans", "donhangs", column: "madh", primary_key: "madh"
  add_foreign_key "nhaphangs", "nguoidungs", column: "mand", primary_key: "mand"
  add_foreign_key "nhaphangs", "sanphams", column: "masp", primary_key: "masp"
  add_foreign_key "sanphams", "loaisps", column: "maloai", primary_key: "maloai"
end
