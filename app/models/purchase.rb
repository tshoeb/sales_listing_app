class Purchase < ActiveRecord::Base
  attr_accessible :delivery_date, :member_id, :product_id, :purchase_date
end
