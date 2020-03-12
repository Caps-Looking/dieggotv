class Bills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.references :customers_package, foreign_key: true
      t.references :customers_additional_service, foreign_key: true
      t.references :month_bill, foreign_key: true, null: true
      t.float :price
      t.date :due_date_for
      t.timestamps
    end
  end
end
