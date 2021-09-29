# typed: true
# frozen_string_literal: true

class Company < ApplicationRecord
  include RailsAdminCharts
  include Pay::Billable

  has_paper_trail
  VALID_EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.freeze

  has_many :users
  belongs_to :pricing

  before_create { self.pricing_id = Pricing.find_by(plan: :trial)&.id if pricing_id.nil? }
  before_save { self.processor = :stripe if processor.nil? }

  validates :email,
            presence: true,
            length: { maximum: 260 },
            format: { with: VALID_EMAIL_FORMAT },
            uniqueness: { case_sensitive: false }
end
