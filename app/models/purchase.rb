class Purchase < ApplicationRecord
  has_many :products, dependent: :destroy
end