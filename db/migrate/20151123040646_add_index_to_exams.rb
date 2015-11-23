class AddIndexToExams < ActiveRecord::Migration
  def change
    add_index :exams, [:user_id, :subject_id], unique: true
  end
end
