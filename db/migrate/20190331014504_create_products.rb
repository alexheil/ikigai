class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :cause
      t.string :title
      t.text :description
      t.text :mini_description
      t.text :element
      t.integer :base_price
      t.integer :shipping_price
      t.integer :total_price
      t.integer :quantity
      t.text :element
      t.text :cause
      t.integer :amount_to_product
      t.integer :amount_to_cause
      t.integer :amount_to_company
      t.integer :size
      t.integer :color
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :slug

      t.timestamps
    end
  end
end
