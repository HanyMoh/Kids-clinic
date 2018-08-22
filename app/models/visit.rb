# == Schema Information
#
# Table name: visits
#
#  id            :integer          not null, primary key
#  code          :integer
#  note          :text
#  turn_num      :integer
#  visit_date    :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  patient_id    :integer
#  user_id       :integer
#  visit_type_id :integer
#
# Indexes
#
#  index_visits_on_patient_id     (patient_id)
#  index_visits_on_user_id        (user_id)
#  index_visits_on_visit_type_id  (visit_type_id)
#

class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :visit_type
  belongs_to :user
  has_many :visit_diagnoses, dependent: :destroy
  has_many :visit_medicaments, dependent: :destroy

  accepts_nested_attributes_for :visit_diagnoses
  accepts_nested_attributes_for :visit_medicaments

  scope :max_code, lambda { maximum('code').to_i + 1 }
  scope :current_turn, lambda { |visit_date|
    Visit.where(visit_date: visit_date).maximum('turn_num').to_i + 1
  }
  scope :last_shank, lambda {order(created_at: :desc).limit(5)}
  scope :current_visits, lambda {|visit_date|
    Visit.where(visit_date: visit_date).order(created_at: :desc)
  }
end
