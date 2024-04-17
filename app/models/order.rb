class Order < ApplicationRecord
  has_many :selected_products
  has_many :ordered_pieces
  has_many :products, through: :selected_products
  attribute :selected_product_names, :string, array: true, default: []
end
