class AddDefaultStatusQuestion < ActiveRecord::Migration
  def change
    change_column :questions, :status, :integer, default: 0
  end
end
