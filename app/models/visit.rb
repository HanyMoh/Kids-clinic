class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :visit_type
  belongs_to :user

  default_scope { order('created_at desc') }
end
