class Region < ApplicationRecord
  has_many :patients

  validates :name, presence: true, length: { within: 2..40 }, uniqueness: true

end
