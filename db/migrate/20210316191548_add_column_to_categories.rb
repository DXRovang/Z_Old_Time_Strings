class AddColumnToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :family_id, :integer
  end
end
