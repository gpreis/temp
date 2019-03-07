class Product < ApplicationRecord
  belongs_to :product_category

  validates :name, presence: true

  delegate :name, to: :product_category, prefix: true
end
