class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :district, null: false
      t.string :number, null: false
      t.string :complement
      t.string :city, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
