class UpdateIndexExam < ActiveRecord::Migration
  def change
    remove_index :exams, [:user_id, :subject_id]
    add_index :exams, [:user_id, :subject_id]
    remove_index :results, [:exam_id, :question_id]
    add_index :results, [:exam_id, :question_id]
  end
end
