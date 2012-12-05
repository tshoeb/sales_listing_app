class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :member_id
      t.integer :product_id
      t.date :purchase_date
      t.date :delivery_date

      t.timestamps
    end
  end
end
