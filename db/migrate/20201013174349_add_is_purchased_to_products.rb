class AddIsPurchasedToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column(:products, :is_purchased, :boolean)
  end
end
