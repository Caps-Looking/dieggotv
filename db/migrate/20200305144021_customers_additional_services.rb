class CustomersAdditionalServices < ActiveRecord::Migration[5.0]
  def change
    create_table :customers_additional_services do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :additional_service, foreign_key: true, null: false
      t.float :price
      t.timestamps
    end
  end
end
