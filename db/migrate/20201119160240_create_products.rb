class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :season
      t.text :description
      t.decimal :price
      t.boolean :onSale
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
