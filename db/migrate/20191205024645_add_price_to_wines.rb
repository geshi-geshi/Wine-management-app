class AddPriceToWines < ActiveRecord::Migration[5.2]
  def change
    add_column :wines, :price, :string
    add_column :wines, :detail, :string
  end
end
