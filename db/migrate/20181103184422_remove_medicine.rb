class RemoveMedicine < ActiveRecord::Migration[5.1]
  def change
    drop_table :medicaments
  end
end
