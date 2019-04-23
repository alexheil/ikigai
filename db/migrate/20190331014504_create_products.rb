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
      t.string :element_image
      t.text :cause
      t.string :cause_large_image
      t.string :cause_small_image
      t.string :amount_to_product
      t.string :product_plus1
      t.string :product_plus2
      t.string :product_plus3
      t.string :product_other
      t.string :amount_to_cause
      t.string :cause_plus1
      t.string :cause_plus2
      t.string :cause_plus3
      t.string :cause_other
      t.string :amount_to_company
      t.string :company_plus1
      t.string :company_plus2
      t.string :company_plus3
      t.string :company_other
      t.integer :size
      t.integer :color
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.boolean :on_sale, default: true
      t.string :slug

      t.timestamps
    end
  end
end
