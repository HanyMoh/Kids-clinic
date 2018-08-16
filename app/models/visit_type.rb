class VisitType < ApplicationRecord
    has_many :visits

    validates :name, presence: true, length: { within: 2..40 }, uniqueness: true

    default_scope { order('created_at desc') }
end
