# typed: strict
# frozen_string_literal: true

class Pricing < ApplicationRecord
  has_many :companies

  has_paper_trail
end
