# == Schema Information
#
# Table name: visit_medicaments
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  medicament_id :integer
#  visit_id      :integer
#
# Indexes
#
#  index_visit_medicaments_on_medicament_id  (medicament_id)
#  index_visit_medicaments_on_visit_id       (visit_id)
#

require 'test_helper'

class VisitMedicamentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
