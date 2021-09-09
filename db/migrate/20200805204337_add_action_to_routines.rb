# typed: true
class AddActionToRoutines < ActiveRecord::Migration[6.0]
  def change
    add_column :routines, :action, :string
  end
end
