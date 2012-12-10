class FixColumnName < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
  	rename_column(:products, :member_id, :user_id)
  	rename_column(:purchases, :member_id, :user_id)
  end
end
