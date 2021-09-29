# typed: true
class AddMessageTemplateToRoutine < ActiveRecord::Migration[6.0]
  def change
    add_column :routines, :message_template, :string
  end
end
