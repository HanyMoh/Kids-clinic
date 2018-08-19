class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :visit_type
  belongs_to :user

  # default_scope { order('created_at desc') }
  scope :max_code, lambda { maximum('code').to_i + 1 }
  scope :current_turn, lambda { |visit_date|
    Visit.where(visit_date: visit_date).maximum('turn_num').to_i + 1
  }
  scope :last_shank, lambda {order(created_at: :desc).limit(5)}
  scope :current_visits, lambda {|visit_date|
    Visit.where(visit_date: visit_date).order(created_at: :desc)
  }
end
