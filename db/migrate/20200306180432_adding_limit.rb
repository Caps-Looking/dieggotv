class AddingLimit < ActiveRecord::Migration[5.0]
  def change
    change_column :customers, :cpf, :string, limit: 11
  end
end
