# typed: true
# This migration comes from pay (originally 20210423235138)
class AddCurrencyToPayCharges < ActiveRecord::Migration[6.0]
  def change
    add_column :pay_charges, :currency, :string
  end
end
