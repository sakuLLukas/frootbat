class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.decimal :price
      t.boolean :available
      t.text :description
      t.string :category
      t.string :brand
      t.string :gtin

      t.timestamps
    end
  end
end
