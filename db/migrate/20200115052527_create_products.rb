class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.float :stock, default: 0.0
      t.integer :price_cents, default: 1
      t.references :unity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
