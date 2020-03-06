class Customers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :cpf
      t.references :package, foreign_key: true, null: false
      t.timestamps
    end
  end
end
