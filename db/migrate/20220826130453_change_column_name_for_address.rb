class ChangeColumnNameForAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column :instruments, :adress, :address
  end
end
