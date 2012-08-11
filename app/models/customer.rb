class Customer < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
end
