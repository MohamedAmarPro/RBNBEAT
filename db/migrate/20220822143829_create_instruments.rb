class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :category
      t.string :brand
      t.integer :age
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
