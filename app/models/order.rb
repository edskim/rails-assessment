class Order < ActiveRecord::Base
  attr_accessible :customer_id, :price, :name
  belongs_to :customer

  validates :customer_id, presence: true
  validates :price, presence: true
  validates :name, presence: true
end
