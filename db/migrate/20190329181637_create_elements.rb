class CreateElements < ActiveRecord::Migration[5.0]
  def change
    create_table :elements do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :color
      t.string :slug

      t.timestamps
    end
  end
end
