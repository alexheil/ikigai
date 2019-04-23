class CreateCauses < ActiveRecord::Migration[5.0]
  def change
    create_table :causes do |t|
      t.references :element
      t.string :title
      t.string :image_large_top
      t.string :image_description
      t.string :image_important
      t.string :image_disaster
      t.string :image_large_bottom
      t.string :image_plan
      t.string :image_product
      t.text :mini_description
      t.text :description
      t.text :important
      t.text :disaster
      t.text :plan
      t.string :raised
      t.string :slug

      t.timestamps
    end
  end
end
