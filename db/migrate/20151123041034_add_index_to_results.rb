class AddIndexToResults < ActiveRecord::Migration
  def change
    add_index :results, [:exam_id, :question_id], unique: true
  end
end
