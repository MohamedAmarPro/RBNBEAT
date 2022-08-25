class AddAdressToInstruments < ActiveRecord::Migration[7.0]
  def change
    add_column :instruments, :adress, :string
  end
end
