class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :exam_id
      t.integer :question_id
      t.integer :is_correct
      t.string :content

      t.timestamps null: false
    end
  end
end
