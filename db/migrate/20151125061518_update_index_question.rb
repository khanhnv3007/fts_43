class UpdateIndexQuestion < ActiveRecord::Migration
  def change
    remove_index :questions, [:user_id, :subject_id]
    add_index :questions, [:user_id, :subject_id]
  end
end
