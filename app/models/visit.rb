class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :visit_type
end
