class AddCardIdToWines < ActiveRecord::Migration[5.2]
  def change
    add_column :wines, :producer, :string
    add_column :wines, :capacity, :integer
  end
end
