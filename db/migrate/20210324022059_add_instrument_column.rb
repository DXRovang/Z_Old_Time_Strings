class AddInstrumentColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :instruments, :for_sale, :boolean, :default => true
  end
end
