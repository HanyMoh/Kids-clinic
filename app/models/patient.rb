class Patient < ApplicationRecord
  has_many :visits
  belongs_to :region, optional: true

  validates :name, presence: true, length: { within: 2..40 }, uniqueness: true

  default_scope { order('created_at desc') }
end
