class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.date :visit_date
      t.references :patient, foreign_key: true
      t.references :visit_type, foreign_key: true
      t.text :description
      t.text :note

      t.timestamps
    end
  end
end
