# typed: strict
class Attendence < ApplicationRecord
  has_paper_trail

  belongs_to :attendants
end
