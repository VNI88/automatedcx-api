# typed: true
class AddCompanyIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :company_id, :bigint
    add_foreign_key :users, :companies
  end
end
