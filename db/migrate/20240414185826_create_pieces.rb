class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string :name
      t.string :brand
      t.string :size
      t.integer :category
      t.timestamps
    end
  end
end
