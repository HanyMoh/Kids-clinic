# == Schema Information
#
# Table name: medicaments
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Medicament < ApplicationRecord
  has_many :visit_medicaments
  validates :name, presence: true, length: { within: 2..40 }, uniqueness: true
end
