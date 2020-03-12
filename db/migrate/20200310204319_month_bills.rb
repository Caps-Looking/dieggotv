class MonthBills < ActiveRecord::Migration[5.0]
  def change
    create_table :month_bills do |t|
      t.references :year_bill, foreign_key: true, null: true
      t.float :total_sum
      t.date :due_date_for
      t.timestamps
    end
  end
end
