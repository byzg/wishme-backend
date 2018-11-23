class CreateSubscribtions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscripions do |t|
      t.integer :user_id, index: true
      t.integer :target_id, index: true

      t.timestamps
    end
  end
end
