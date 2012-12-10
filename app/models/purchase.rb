class Purchase < ActiveRecord::Base
  attr_accessible :delivery_date, :user_id, :product_id, :purchase_date

  validates :delivery_date, :user_id, :product_id, :purchase_date, :presence => true
end
