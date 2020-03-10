class Bill < ActiveRecord::Migration[5.0]
  def change
    create_table :bill do |t|
      t.references :customers_package, foreign_key: true, null: false
      t.references :customers_additional_service, foreign_key: true, null: false
      t.float :amount
      t.date :due_date
      t.timestamps
    end
  end
end
