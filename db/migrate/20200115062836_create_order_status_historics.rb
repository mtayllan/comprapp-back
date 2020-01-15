class CreateOrderStatusHistorics < ActiveRecord::Migration[6.0]
  def change
    create_table :order_status_historics do |t|
      t.integer :status, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
