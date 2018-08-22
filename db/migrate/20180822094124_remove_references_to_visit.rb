class RemoveReferencesToVisit < ActiveRecord::Migration[5.1]
  def change
    remove_reference :visits, :diagnosis, foreign_key: true
    remove_reference :visits, :medicament, foreign_key: true
  end
end
