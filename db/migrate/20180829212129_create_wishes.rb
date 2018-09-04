class CreateWishes < ActiveRecord::Migration[5.1]
  def change
    create_table :wishes do |t|
      t.string :title
      t.text :text
      t.integer :price
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
