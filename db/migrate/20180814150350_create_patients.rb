class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.integer :code
      t.string :name
      t.string :phone
      t.date :birthdate
      t.references :region, foreign_key: true
      t.string :address
      t.text :note

      t.timestamps
    end
  end
end
