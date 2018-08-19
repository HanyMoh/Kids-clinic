class Patient < ApplicationRecord
  has_many :visits, dependent: :destroy
  belongs_to :region, optional: true

  validates :name, presence: true, length: { within: 2..40 }, uniqueness: true

  scope :max_code, lambda { maximum(:code).to_i + 1 }
end
