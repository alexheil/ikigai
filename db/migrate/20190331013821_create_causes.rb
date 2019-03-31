class CreateCauses < ActiveRecord::Migration[5.0]
  def change
    create_table :causes do |t|
      t.reference :element
      t.string :title
      t.text :description
      t.text :important
      t.text :plan
      t.string :raised
      t.string :slug

      t.timestamps
    end
  end
end
