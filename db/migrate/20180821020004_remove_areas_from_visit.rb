class RemoveAreasFromVisit < ActiveRecord::Migration[5.1]
  def change
    remove_column :visits, :medicament, :string
    remove_column :visits, :description, :string
  end
end
