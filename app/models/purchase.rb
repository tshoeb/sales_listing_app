class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  attr_accessible :delivery_date, :user_id, :product_id, :purchase_date

  validates :delivery_date, :user_id, :product_id, :purchase_date, :presence => true

  scope :chronological, order('purchase_date DESC')
  scope :latest, lambda{|num| limit(num).order('purchase_date DESC')}
  scope :for_product, lambda{|product_id| where("product_id = ?", product_id)}
end
