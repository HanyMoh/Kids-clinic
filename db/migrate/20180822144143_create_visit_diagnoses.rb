class CreateVisitDiagnoses < ActiveRecord::Migration[5.1]
  def change
    create_table :visit_diagnoses do |t|
      t.references :visit, index: true
      t.references :diagnosis, index: true

      t.timestamps
    end
  end
end
