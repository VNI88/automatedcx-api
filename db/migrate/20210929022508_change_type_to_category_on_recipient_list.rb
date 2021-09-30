class ChangeTypeToCategoryOnRecipientList < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipient_lists, :type, :category
  end
end
