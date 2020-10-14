class Product < ApplicationRecord
  has_one :purchase
  validates :name, presence: true
  validates :price, presence: true
end