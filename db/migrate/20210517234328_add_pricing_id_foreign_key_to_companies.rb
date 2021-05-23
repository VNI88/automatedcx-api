class AddPricingIdForeignKeyToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :pricing_id, :bigint, null: false
    add_foreign_key :companies, :pricings
  end
end
