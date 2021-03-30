class ChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :instruments, :price, :decimal
  end
end
