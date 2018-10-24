class ChangePriceType < ActiveRecord::Migration[5.1]
  def change
    change_column :wishes, :price, :money
  end
end
