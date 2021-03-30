class DropColumnFromInstruments < ActiveRecord::Migration[6.1]
  def change
    remove_column :instruments, :family_id, :integer
  end
end
