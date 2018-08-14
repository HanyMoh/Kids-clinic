class Patient < ApplicationRecord
  belongs_to :region, optional: true
end
