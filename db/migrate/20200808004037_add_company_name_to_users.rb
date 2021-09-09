# typed: true
class AddCompanyNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :company_name, :string, null: false
  end
end
