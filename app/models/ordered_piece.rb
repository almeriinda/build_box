class OrderedPiece < ApplicationRecord
  belongs_to :order
  belongs_to :piece
end
