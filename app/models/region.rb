# == Schema Information
#
# Table name: regions
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Region < ApplicationRecord
  has_many :patients

  validates :name, presence: true, length: { within: 2..40 }, uniqueness: true

end
