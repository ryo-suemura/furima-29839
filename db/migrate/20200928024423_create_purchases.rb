class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :item_id,          null: false, foreign_key: true
      t.integer :user_id,          null: false, foreign_key: true
      t.integer
      t.timestamps
    end
  end
end
