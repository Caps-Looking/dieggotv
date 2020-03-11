class YearBills < ActiveRecord::Migration[5.0]
  def change
    create_table :year_bills do |t|
      t.references :customer, foreign_key: true, null: true
      t.date :competence
      t.timestamps
    end
  end
end
