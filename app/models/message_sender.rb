# frozen_string_literal: true

# typed: false

class MessageSender < ApplicationRecord
  has_paper_trail
  has_many :routines
end
