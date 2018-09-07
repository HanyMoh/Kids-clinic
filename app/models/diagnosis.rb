# == Schema Information
#
# Table name: diagnoses
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Diagnosis < ApplicationRecord
  has_many :visit_diagnoses
  validates :name, presence: true, length: { within: 2..40 }, uniqueness: true
end
