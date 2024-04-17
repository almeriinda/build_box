class CreateOrderedPieces < ActiveRecord::Migration[6.0]
  def change
    create_table :ordered_pieces do |t|
      t.references :order, null: false, foreign_key: true
      t.references :piece, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
