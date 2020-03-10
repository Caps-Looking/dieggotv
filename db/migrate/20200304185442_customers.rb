class Customers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :cpf
      t.timestamps
    end
  end
end
