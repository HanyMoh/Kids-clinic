# == Schema Information
#
# Table name: patients
#
#  id         :integer          not null, primary key
#  address    :string
#  birthdate  :date
#  code       :integer
#  is_male    :boolean          default(TRUE)
#  name       :string
#  note       :text
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :integer
#
# Indexes
#
#  index_patients_on_region_id  (region_id)
#

class Patient < ApplicationRecord
  has_many :visits, dependent: :destroy
  belongs_to :region, optional: true

  validates :name, presence: true, length: { within: 2..40 }, uniqueness: true

  scope :max_code, lambda { maximum(:code).to_i + 1 }
end
