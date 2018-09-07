# == Schema Information
#
# Table name: visit_types
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VisitType < ApplicationRecord
    has_many :visits

    validates :name, presence: true, length: { within: 2..40 }, uniqueness: true

    default_scope { order('created_at desc') }
end
