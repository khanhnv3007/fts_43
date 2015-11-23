ActiveRecord::Schema.define(version: 20151123041127) do

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.integer  "is_correct"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "exams", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "user_id"
    t.integer  "status"
    t.integer  "duration"
    t.integer  "number_of_question"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "exams", ["user_id", "subject_id"], name: "index_exams_on_user_id_and_subject_id", unique: true

  create_table "questions", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "user_id"
    t.integer  "status"
    t.integer  "type"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["user_id", "subject_id"], name: "index_questions_on_user_id_and_subject_id", unique: true

  create_table "results", force: :cascade do |t|
    t.integer  "exam_id"
    t.integer  "question_id"
    t.integer  "is_correct"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "results", ["exam_id", "question_id"], name: "index_results_on_exam_id_and_question_id", unique: true

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "chatwork_id"
    t.string   "email"
    t.integer  "role"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
