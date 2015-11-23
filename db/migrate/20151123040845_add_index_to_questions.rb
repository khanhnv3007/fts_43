class AddIndexToQuestions < ActiveRecord::Migration
  def change
    add_index :questions, [:user_id, :subject_id], unique: true
  end
end
