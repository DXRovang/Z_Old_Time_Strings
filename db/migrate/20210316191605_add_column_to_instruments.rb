class AddColumnToInstruments < ActiveRecord::Migration[6.1]
  def change
    add_column :instruments, :family_id, :integer
  end
end
