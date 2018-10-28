class ChangePriceType < ActiveRecord::Migration[5.1]
  def up
    change_column :wishes, :price, :decimal, precision: 10, scale: 2
  end

  def down
    change_column :wishes, :price, 'integer USING 0'
  end
end
