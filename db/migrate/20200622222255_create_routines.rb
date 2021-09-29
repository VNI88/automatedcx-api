# typed: true
class CreateRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :routines, id: :serial do |t|
      t.string :name, null: false
      t.string :status, null: false
      t.datetime :started_at, default: Time.now
      t.datetime :updated_at, default: Time.now
      t.datetime :finished_at
    end
  end
end
