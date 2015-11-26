class AddDefaultStatusExam < ActiveRecord::Migration
  def change
    change_column :exams, :status, :integer, default: 0
  end
end
