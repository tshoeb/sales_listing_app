class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :name
      t.string :price
      t.string :description
      t.string :color
      t.string :brand
      t.boolean :fragile
      t.boolean :available
      t.date :listing_date
      t.date :expiry_date

      t.timestamps
    end
  end
end
