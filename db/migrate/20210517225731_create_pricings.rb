class CreatePricings < ActiveRecord::Migration[6.0]
  def change
    create_table :pricings, id: :serial do |t|
      t.string :plan, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
