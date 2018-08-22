class CreateVisitMedicaments < ActiveRecord::Migration[5.1]
  def change
    create_table :visit_medicaments do |t|
      t.references :visit, index: true
      t.references :medicament, index: true

      t.timestamps
    end
  end
end
