class AddJtiToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :jti, :string
    add_index :employees, :jti, unique: true
  end
end
