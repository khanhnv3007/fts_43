class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :subject_id
      t.integer :user_id
      t.integer :status
      t.integer :duration
      t.integer :number_of_question

      t.timestamps null: false
    end
  end

  add_index :relationships, [:follower_id, :followed_id], unique: true
end
