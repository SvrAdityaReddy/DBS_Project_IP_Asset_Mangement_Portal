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

ActiveRecord::Schema.define(version: 20161130161802) do

  create_table "creations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "tp"
    t.string   "proposal"
    t.integer  "creator_id"
    t.integer  "royalty",             default: 0, null: false
    t.integer  "liabilities",         default: 0, null: false
    t.string   "ip_policy"
    t.integer  "ip_flag",             default: 0, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "approver"
  end

  create_table "license_tos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "creation_id"
    t.string   "name",                          null: false
    t.integer  "uid",                           null: false
    t.string   "LIA_file_name"
    t.string   "LIA_content_type"
    t.integer  "LIA_file_size"
    t.datetime "LIA_updated_at"
    t.boolean  "approve"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "licenceagreement_file_name"
    t.string   "licenceagreement_content_type"
    t.integer  "licenceagreement_file_size"
    t.datetime "licenceagreement_updated_at"
    t.index ["creation_id"], name: "index_license_tos_on_creation_id", using: :btree
  end

  create_table "owns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "creation_id"
    t.float    "precentage",  limit: 24
    t.string   "email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["creation_id"], name: "index_owns_on_creation_id", using: :btree
    t.index ["user_id"], name: "index_owns_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "Occupation"
    t.integer  "IPflag",                 default: 0,  null: false
    t.integer  "adminflag",              default: 0,  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
