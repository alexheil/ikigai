class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.references :product
      t.references :user
      t.integer :size, default: 0
      t.integer :color, default: 0
      t.string :stripe_charge_id
      t.boolean :use_your_card, default: false
      t.integer :quantity, default: 1
      t.integer :pay_your_own_price, default: 0
      t.integer :complete_price
      t.string :full_name, default: ""
      t.string :street_address, default: ""
      t.string :city, default: ""
      t.string :state, default: ""
      t.string :country, default: ""
      t.string :zip_code, default: ""
      t.boolean :is_shipped, default: false, null: false

      t.timestamps
    end

    add_index :purchases, :stripe_charge_id
    add_index :purchases, :price
    add_index :purchases, :currency
  end
end
