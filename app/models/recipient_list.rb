# frozen_string_literal: true

# typed: false

class RecipientList < ApplicationRecord
  has_paper_trail
  has_many :routines
end
