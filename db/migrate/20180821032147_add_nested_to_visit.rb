class AddNestedToVisit < ActiveRecord::Migration[5.1]
  def change
    add_reference :visits, :diagnosis, foreign_key: true
    add_reference :visits, :medicament, foreign_key: true
  end
end
