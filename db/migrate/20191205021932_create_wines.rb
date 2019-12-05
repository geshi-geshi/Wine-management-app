class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :color
      t.string :classification
      t.string :country
      t.string :region
      t.string :area
      t.string :grape_variety
      t.string :appearance
      t.string :aroma
      t.string :taste
      t.integer :production_year
      t.integer :alcohol_content

      t.timestamps
    end
  end
end
