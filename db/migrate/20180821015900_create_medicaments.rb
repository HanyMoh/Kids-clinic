class CreateMedicaments < ActiveRecord::Migration[5.1]
  def change
    create_table :medicaments do |t|
      t.string :name

      t.timestamps
    end
  end
end
