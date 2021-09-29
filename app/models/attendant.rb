# typed: strict
class Attendant < ApplicationRecord
  has_paper_trail

  belongs_to :user
  has_many :attendences
end
