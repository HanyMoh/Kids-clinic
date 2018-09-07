# == Schema Information
#
# Table name: visit_diagnoses
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  diagnosis_id :bigint(8)
#  visit_id     :bigint(8)
#
# Indexes
#
#  index_visit_diagnoses_on_diagnosis_id  (diagnosis_id)
#  index_visit_diagnoses_on_visit_id      (visit_id)
#

require 'test_helper'

class VisitDiagnosisTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
