class YearBills < ActiveRecord::Migration[5.0]
  def change
    create_table :year_bills do |t|
      t.references :customer, foreign_key: true, null: true
      t.date :init_date
      t.date :end_date
      t.timestamps
    end
  end
end
