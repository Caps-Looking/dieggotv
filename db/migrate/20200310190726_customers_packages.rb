class CustomersPackages < ActiveRecord::Migration[5.0]
  def change
    create_table :customers_packages do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :package, foreign_key: true, null: false
      t.float :price
      t.timestamps
    end
  end
end
