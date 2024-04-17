class Product < ApplicationRecord
  has_many :ordered_pieces
  has_many :orders, through: :ordered_pieces

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, inclusion: { in: ['Processador', 'Placa Mãe', 'Memória RAM', 'Placa de Vídeo'] }
end

