class Attendant < ApplicationRecord
  belongs_to :user
  has_many :attendences
end
