class Purchase < ActiveRecord::Base
  attr_accessible :delivery_date, :product_id, :purchase_date, :user_id
end
