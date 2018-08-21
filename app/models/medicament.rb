class Medicament < ApplicationRecord
  validates :name, presence: true, length: { within: 2..40 }, uniqueness: true
end
