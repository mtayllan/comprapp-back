class CreateOrderProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :order_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.float :amount, null: false
      t.integer :price_cents, null: false, default: 0

      t.timestamps
    end
  end
end
