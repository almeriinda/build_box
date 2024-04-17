class AddSelectedProductNamesToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :selected_product_names, :string, array: true, default: []
  end
end
