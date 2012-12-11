class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  attr_accessible :delivery_date, :user_id, :product_id, :purchase_date

  validates :delivery_date, :user_id, :product_id, :purchase_date, :presence => true

  attr_accessible :delivery_date, :product_id, :purchase_date, :user_id

end
