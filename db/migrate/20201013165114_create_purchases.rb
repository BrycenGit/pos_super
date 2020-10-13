class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :name
      t.decimal :total, precision: 10, scale: 2

      t.timestamps
    end
  end
end
