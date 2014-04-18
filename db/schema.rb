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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140103043028) do

  create_table "categories", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charcoal_dusts", force: true do |t|
    t.string   "charcoal_id"
    t.string   "bweight"
    t.string   "pweight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charcoals", force: true do |t|
    t.string   "su_code"
    t.string   "form_code"
    t.string   "weightbridge_code"
    t.date     "date"
    t.string   "truck_no",          limit: 20
    t.integer  "partical_weight"
    t.integer  "weight"
    t.string   "doc1"
    t.string   "doc2"
    t.string   "doc3"
    t.string   "doc4"
    t.string   "doc5"
    t.string   "doc6"
    t.string   "inspector"
    t.string   "grade"
    t.string   "crash_sum_form"
    t.string   "t1"
    t.string   "t2"
    t.string   "t3"
    t.string   "t4"
    t.string   "t5"
    t.string   "t6"
    t.string   "analyst"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ctype"
  end

  create_table "coas", force: true do |t|
    t.string   "code"
    t.date     "date"
    t.string   "invoicepo"
    t.string   "contract"
    t.string   "spec"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coasilicons", force: true do |t|
    t.string   "coa_id"
    t.string   "silicon_id"
    t.string   "bag"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "complains", force: true do |t|
    t.string   "code"
    t.date     "date"
    t.string   "customer_name"
    t.string   "po"
    t.string   "ma_dept"
    t.string   "mi_dept"
    t.string   "action"
    t.string   "trace"
    t.string   "content",       null: false
    t.string   "c_type",        null: false
    t.date     "trace_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "country"
    t.string   "address"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dailyreport_jobs", force: true do |t|
    t.string   "dailyreport_id"
    t.string   "job_title"
    t.string   "time_shift"
    t.string   "p_attend"
    t.string   "a_attend"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dailyreports", force: true do |t|
    t.date     "date"
    t.string   "dept"
    t.string   "content",    limit: 1000
    t.string   "unfinish",   limit: 1000
    t.string   "abnormal",   limit: 1000
    t.string   "manager"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "operator"
  end

  create_table "departments", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "manager"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abb",        limit: 10
  end

  create_table "destinations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "e_furnaces", force: true do |t|
    t.string   "furnace"
    t.date     "date"
    t.string   "manager"
    t.string   "operator"
    t.integer  "s1_e"
    t.integer  "s2_e"
    t.integer  "s3_e"
    t.integer  "s1_q"
    t.integer  "s2_q"
    t.integer  "s3_q"
    t.integer  "s1_w"
    t.integer  "s2_w"
    t.integer  "s3_w"
    t.integer  "s1_ch"
    t.integer  "s2_ch"
    t.integer  "s3_ch"
    t.integer  "s1_c"
    t.integer  "s2_c"
    t.integer  "s3_c"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "s1_fe"
    t.integer  "s2_fe"
    t.integer  "s3_fe"
    t.string   "foreman_s1",     null: false
    t.string   "foreman_s2",     null: false
    t.string   "foreman_s3",     null: false
    t.integer  "s1_electrode_a"
    t.integer  "s1_electrode_b"
    t.integer  "s1_electrode_c"
    t.integer  "s2_electrode_a"
    t.integer  "s2_electrode_b"
    t.integer  "s2_electrode_c"
    t.integer  "s3_electrode_a"
    t.integer  "s3_electrode_b"
    t.integer  "s3_electrode_c"
  end

  create_table "employeer_photos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "employeer_id"
  end

  create_table "employeers", force: true do |t|
    t.string   "employee_no",     limit: 10
    t.string   "name_org",        limit: 40
    t.string   "name_ch",         limit: 10
    t.string   "dept_org",        limit: 10
    t.string   "position_org",    limit: 10
    t.string   "card_no"
    t.string   "age",             limit: 10
    t.date     "s_date"
    t.date     "e_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remark"
    t.string   "employee_no_old", limit: 10
    t.string   "name_en",         limit: 20
    t.date     "conf_date"
    t.string   "em_type",         limit: 10
    t.string   "sub_company",     limit: 10
    t.string   "country",         limit: 20
    t.string   "gender",          limit: 5
    t.date     "wp_date"
    t.date     "birthday"
    t.string   "marriage",        limit: 10
    t.string   "edu",             limit: 10
    t.string   "major",           limit: 50
    t.string   "tel_home",        limit: 15
    t.string   "mobile",          limit: 10
    t.string   "id_type",         limit: 10
    t.string   "id_no",           limit: 25
    t.string   "doc_38_1",        limit: 50
    t.string   "address_reg",     limit: 100
    t.string   "address_post",    limit: 100
  end

  create_table "en_certifies", force: true do |t|
    t.string   "lot"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "env_monitors", force: true do |t|
    t.string   "time"
    t.string   "p_airtank"
    t.string   "furnace"
    t.string   "o_bearing1"
    t.string   "o_bearing2"
    t.string   "o_current"
    t.string   "m_current"
    t.string   "m_speed"
    t.string   "m_bearing1"
    t.string   "m_bearing2"
    t.string   "m_stator"
    t.string   "c_in_t"
    t.string   "o_t"
    t.string   "in_c"
    t.string   "bc_p"
    t.string   "ac_p"
    t.string   "rs_bearing1"
    t.string   "rs_bearing2"
    t.string   "rs_current"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "operator"
  end

  create_table "freights", force: true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", force: true do |t|
    t.string   "product",    null: false
    t.string   "name",       null: false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_attendences", id: false, force: true do |t|
    t.string   "Device_Name"
    t.string   "Door"
    t.string   "Name"
    t.string   "Emp_No"
    t.string   "Card_No"
    t.datetime "Time_of_swipe_card"
    t.string   "Event_Explanation"
    t.string   "Department"
    t.string   "eventCode"
    t.string   "devicetype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "hr_dept_changes", force: true do |t|
    t.date     "date"
    t.string   "employee_no"
    t.string   "dept_old"
    t.string   "dept_new"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_otms", force: true do |t|
    t.string   "e_id"
    t.string   "dept"
    t.time     "stime"
    t.time     "etime"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "hr_positions", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "salary"
    t.integer  "bonus"
    t.integer  "benfit1"
    t.integer  "benfit2"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_subcompanies", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interviews_its", force: true do |t|
    t.string   "ans1"
    t.string   "ans2"
    t.string   "ans3"
    t.string   "ans4"
    t.string   "ans5"
    t.string   "ans6"
    t.string   "ans7"
    t.string   "ans8"
    t.string   "ans9"
    t.string   "ans10"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 100, null: false
    t.string   "phone",      limit: 15,  null: false
  end

  create_table "it_devices", force: true do |t|
    t.string   "code"
    t.string   "dept"
    t.string   "user"
    t.string   "c_type"
    t.date     "pdate"
    t.string   "brand"
    t.string   "model"
    t.string   "os"
    t.string   "cpu"
    t.string   "hdd"
    t.string   "mac"
    t.string   "ip"
    t.string   "ram"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "it_repairs", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "dept"
    t.string   "phone"
    t.string   "problem"
    t.string   "detail"
    t.string   "solution"
    t.string   "causes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "c_name",       limit: 10
    t.string   "operation_ip", limit: 20
    t.string   "operator",     limit: 10
  end

  create_table "it_reservations", force: true do |t|
    t.datetime "date"
    t.string   "device"
    t.string   "user"
    t.string   "dept"
    t.string   "location"
    t.string   "reason"
    t.string   "remark"
    t.datetime "r_date"
    t.string   "r_confirm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microsilicas", force: true do |t|
    t.date     "date"
    t.string   "silo"
    t.string   "m_type"
    t.integer  "bag"
    t.string   "density"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bsize"
    t.string   "operator",   limit: 50
    t.string   "location",   limit: 50
    t.string   "inspector",  limit: 50
    t.string   "remark"
    t.string   "status"
  end

  create_table "ms_bag_inventories", force: true do |t|
    t.date     "date"
    t.string   "action"
    t.string   "bag_type"
    t.integer  "quantity"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ms_bags", force: true do |t|
    t.string   "code"
    t.string   "bag_type"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "safe"
  end

  create_table "ms_loadings", force: true do |t|
    t.date     "date"
    t.string   "customer"
    t.string   "product"
    t.date     "p_date"
    t.string   "invoice",     limit: 25
    t.string   "po",          limit: 20
    t.string   "po_index",    limit: 2
    t.integer  "quantity"
    t.string   "freight"
    t.string   "destination"
    t.string   "c_type"
    t.integer  "c_qty"
    t.string   "t_loading"
    t.datetime "closing"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bsize"
    t.integer  "c_cap"
    t.string   "fifo",        limit: 20
    t.string   "lashing",     limit: 20
    t.string   "pallet",      limit: 20
    t.string   "contact",     limit: 100
    t.string   "s_mark",      limit: 20
  end

  create_table "ms_losses", force: true do |t|
    t.date     "s_date"
    t.date     "e_date"
    t.string   "spec"
    t.string   "bsize"
    t.string   "qty"
    t.string   "operator"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ms_offgrades", force: true do |t|
    t.date     "date"
    t.string   "origin"
    t.string   "m_type"
    t.string   "weight"
    t.string   "location"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ms_prod_confirms", force: true do |t|
    t.date     "date"
    t.string   "manager"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remark"
  end

  create_table "ms_reworks", force: true do |t|
    t.string   "lot",        limit: 20
    t.string   "bag",        limit: 20
    t.string   "remark"
    t.string   "operator"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ms_shippments", force: true do |t|
    t.string   "po"
    t.string   "gpo"
    t.date     "date"
    t.string   "container"
    t.string   "trailer"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "mssamples", force: true do |t|
    t.string   "cate"
    t.string   "location"
    t.string   "weight"
    t.string   "typ"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sample_id",  null: false
    t.string   "batch"
    t.string   "sdate",      null: false
    t.string   "edate",      null: false
  end

  create_table "msship_photos", force: true do |t|
    t.string   "ms_shippment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "msshipbags", force: true do |t|
    t.string   "msshiplot_id"
    t.integer  "bag"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "msshiplots", force: true do |t|
    t.string   "ms_shippment_id"
    t.string   "spec"
    t.string   "lsilo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remark"
    t.integer  "bsize"
    t.string   "lweek"
    t.string   "lyear"
  end

  create_table "oxygens", force: true do |t|
    t.integer  "a"
    t.integer  "b"
    t.integer  "ch"
    t.integer  "cl"
    t.integer  "dh"
    t.integer  "dl"
    t.integer  "eh"
    t.integer  "el"
    t.integer  "f"
    t.integer  "g"
    t.integer  "h"
    t.integer  "i"
    t.integer  "jh"
    t.integer  "jl"
    t.integer  "k"
    t.integer  "l"
    t.integer  "m"
    t.integer  "n"
    t.integer  "o"
    t.integer  "p"
    t.float    "q"
    t.integer  "r"
    t.integer  "s"
    t.float    "t"
    t.integer  "u"
    t.float    "v"
    t.string   "operator"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partical_sizes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.date     "date"
    t.string   "invoice"
    t.string   "po"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pickings", force: true do |t|
    t.string   "employeer"
    t.string   "wh_item"
    t.integer  "qty"
    t.string   "status"
    t.date     "r_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "operator"
    t.string   "dept",       limit: 50
    t.string   "code",       limit: 20
  end

  create_table "pics", force: true do |t|
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.integer  "silicon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "po_controls", force: true do |t|
    t.date     "date"
    t.string   "po_no"
    t.string   "contract_no"
    t.string   "customer"
    t.date     "d_date"
    t.string   "destination"
    t.string   "product"
    t.string   "grade"
    t.string   "quantity"
    t.string   "b_size"
    t.string   "p_size"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "power_factors", force: true do |t|
    t.integer  "m1"
    t.integer  "m2"
    t.integer  "env"
    t.integer  "others"
    t.integer  "furnace"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "power_furnaces", force: true do |t|
    t.string   "total_id"
    t.integer  "furnace"
    t.string   "electricity", limit: 20
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "power_totals", force: true do |t|
    t.date     "date"
    t.string   "m_1",        limit: 20
    t.string   "m_2",        limit: 20
    t.string   "env",        limit: 20
    t.string   "others",     limit: 20
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "operator",   limit: 20
    t.string   "time",       limit: 200
  end

  create_table "purchase_locations", force: true do |t|
    t.string   "name"
    t.string   "phone",      limit: 20
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_request_photos", force: true do |t|
    t.string   "request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "purchase_requests", force: true do |t|
    t.string   "code",               limit: 20
    t.string   "name",               limit: 30
    t.string   "dept",               limit: 50
    t.string   "i_name",             limit: 50
    t.integer  "qty"
    t.string   "location",           limit: 40
    t.date     "deadline"
    t.string   "confirm",            limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remark"
    t.date     "p_date"
    t.date     "a_date"
    t.integer  "a_price"
    t.string   "p_type"
    t.integer  "estimate_price"
    t.string   "reject"
    t.integer  "a_qty"
    t.string   "wh_confirm",         limit: 30
    t.date     "wh_date"
    t.string   "wh_location",        limit: 20
    t.string   "p_confirm",          limit: 30
    t.datetime "confirm_date"
    t.datetime "p_confirm_date"
    t.datetime "a_finish_date"
    t.datetime "wh_submit_date"
    t.string   "p_date_operator",    limit: 30
    t.string   "a_finish_name",      limit: 30
    t.datetime "p_submit_date"
    t.string   "note"
    t.string   "p_note",             limit: 200
    t.datetime "p_note_date"
    t.string   "a_finish_remark"
    t.string   "item_code",          limit: 45
    t.string   "unit",               limit: 45
    t.datetime "wh_reject_date"
    t.string   "wh_reject_note"
    t.string   "wh_reject_operator", limit: 45
  end

  create_table "purchase_units", force: true do |t|
    t.string   "code"
    t.string   "unit"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quartz_photos", force: true do |t|
    t.string   "quartz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "quartzs", force: true do |t|
    t.string   "code"
    t.date     "date"
    t.string   "color"
    t.string   "supplier"
    t.string   "location"
    t.string   "fe"
    t.string   "al"
    t.string   "ca"
    t.string   "loi"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rm_rates", force: true do |t|
    t.string   "name"
    t.string   "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code",       limit: 20
  end

  create_table "sampleresults", force: true do |t|
    t.date     "date"
    t.string   "stype"
    t.integer  "week"
    t.string   "silo"
    t.float    "h2o"
    t.float    "loi"
    t.float    "sic"
    t.float    "c"
    t.float    "density"
    t.float    "sieve"
    t.float    "ph"
    t.float    "sio2"
    t.float    "fe"
    t.float    "al"
    t.float    "ca"
    t.float    "mg"
    t.float    "na"
    t.float    "k"
    t.float    "p"
    t.float    "s"
    t.float    "cl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "samples", force: true do |t|
    t.string   "date"
    t.string   "destination"
    t.string   "com"
    t.string   "awb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product"
    t.string   "price",       null: false
  end

  create_table "security_case_media", force: true do |t|
    t.string   "security_case_id"
    t.string   "media_file_name"
    t.string   "media_content_type"
    t.integer  "media_file_size"
    t.datetime "media_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "security_cases", force: true do |t|
    t.datetime "datetime"
    t.string   "dept"
    t.string   "category"
    t.string   "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "s_type",     limit: 20
  end

  create_table "si_inventories", force: true do |t|
    t.date     "date",                    null: false
    t.string   "furnace",      limit: 5
    t.string   "shift",        limit: 5
    t.string   "no",           limit: 5
    t.string   "bag",          limit: 5
    t.integer  "weight"
    t.string   "grade",        limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remark"
    t.string   "location",     limit: 5
    t.string   "bag_no",       limit: 20
    t.string   "operator",     limit: 45
    t.date     "wh_date"
    t.string   "wh_operator",  limit: 45
    t.string   "remark_prod"
    t.string   "gpo_code",     limit: 45
    t.string   "container_no", limit: 45
  end

  create_table "si_inventory_contents", force: true do |t|
    t.string   "si_inventory_id", limit: 20
    t.date     "p_date"
    t.string   "furnace",         limit: 5
    t.string   "shift",           limit: 5
    t.string   "no",              limit: 5
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employee_code",   limit: 15
  end

  create_table "silicashiplots", force: true do |t|
    t.string   "silicaship_id"
    t.string   "lot"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "remark"
  end

  create_table "silicaships", force: true do |t|
    t.date     "date"
    t.string   "po"
    t.string   "coa"
    t.string   "spec"
    t.string   "container"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer"
    t.string   "code"
    t.string   "create_user"
    t.string   "gpo",         limit: 25
  end

  create_table "silicon_metal_gpos", force: true do |t|
    t.string   "po"
    t.string   "gpo_code"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "silicon_metal_mix_bag_contents", force: true do |t|
    t.string   "mix_bag_id"
    t.string   "old_bag_no"
    t.integer  "weight"
    t.string   "operator"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "silicon_metal_mix_bags", force: true do |t|
    t.date     "date"
    t.string   "bag_no",       limit: 20
    t.string   "operator"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location",     limit: 45
    t.string   "gpo_code",     limit: 45
    t.string   "container_no", limit: 45
  end

  create_table "silicon_metal_pos", force: true do |t|
    t.date     "date"
    t.string   "po_code"
    t.string   "customer"
    t.string   "product"
    t.string   "grade"
    t.integer  "b_size"
    t.integer  "qty"
    t.string   "p_size"
    t.string   "contract_no"
    t.string   "destination"
    t.date     "deadline"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "silicon_metal_si_shippings", force: true do |t|
    t.date     "date"
    t.string   "container_no"
    t.string   "operator"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "silicons", force: true do |t|
    t.string   "code"
    t.date     "date",                                        null: false
    t.string   "furnace"
    t.string   "shift"
    t.string   "no"
    t.string   "grade",                  default: "Undefine"
    t.integer  "weight",                 default: 1
    t.integer  "fe"
    t.integer  "al"
    t.integer  "ca"
    t.integer  "ti"
    t.integer  "p"
    t.integer  "b"
    t.integer  "na"
    t.integer  "cu"
    t.integer  "ni"
    t.integer  "mn"
    t.integer  "sn"
    t.integer  "k"
    t.integer  "pb"
    t.integer  "v"
    t.integer  "cr"
    t.integer  "zn"
    t.integer  "s"
    t.text     "remark"
    t.string   "operator"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sweight",                default: 1
    t.string   "sampler"
    t.string   "location_po", limit: 50
    t.string   "location_pa", limit: 50
    t.string   "si_type",     limit: 10
  end

  create_table "silos", force: true do |t|
    t.string   "silo"
    t.string   "temperture"
    t.string   "pressure"
    t.string   "level"
    t.string   "density"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "operator"
    t.string   "packing"
    t.integer  "roots"
  end

  create_table "stores", force: true do |t|
    t.date     "date"
    t.string   "bag_no"
    t.date     "date_in"
    t.string   "location"
    t.integer  "weight"
    t.string   "grade"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "v_netweights", force: true do |t|
    t.string   "code"
    t.string   "net_weight"
    t.string   "remark"
    t.string   "operator"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "vehicle_dailies", force: true do |t|
    t.date     "date"
    t.string   "v_id"
    t.string   "fuel"
    t.string   "distance"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "operator",   limit: 30
    t.string   "rtime",      limit: 20
  end

  create_table "vehicle_requests", force: true do |t|
    t.datetime "s_time",                null: false
    t.datetime "e_time",                null: false
    t.string   "v_code",                null: false
    t.string   "work",                  null: false
    t.string   "remark"
    t.string   "applicant",             null: false
    t.string   "operator"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dept",       limit: 50, null: false
  end

  create_table "vehicles", force: true do |t|
    t.string   "code"
    t.string   "v_type"
    t.string   "model"
    t.string   "number"
    t.date     "p_date"
    t.string   "price"
    t.string   "engine_no"
    t.string   "remark"
    t.string   "dept"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warehouse_checkins", force: true do |t|
    t.date     "date"
    t.string   "p_code",     limit: 20
    t.integer  "w_qty"
    t.string   "remark"
    t.string   "operator",   limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item_code",  limit: 45
  end

  create_table "warehouse_item_photos", force: true do |t|
    t.string   "warehouse_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "warehouse_items", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "c_type"
    t.string   "spec"
    t.string   "dept"
    t.string   "supplier"
    t.integer  "quantity"
    t.integer  "safe"
    t.string   "location"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "model"
  end

  create_table "warehouse_suppliers", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "type"
    t.string   "phone"
    t.string   "website"
    t.string   "address"
    t.string   "email"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weightings", force: true do |t|
    t.string   "form_no"
    t.string   "truck_id"
    t.string   "destination"
    t.string   "truck_type"
    t.string   "cargo"
    t.integer  "weight"
    t.string   "remark"
    t.string   "operator"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
