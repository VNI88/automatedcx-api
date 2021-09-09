# typed: true
class AddPlansToPricings < ActiveRecord::Migration[6.0]
  def change
    Pricing.create!([{ plan: :trial, price: 0 },
                     { plan: :basic, price: 100_00 },
                     { plan: :standard, price: 300_00 },
                     { plan: :premium, price: 1_000_00 }])
  end
end
