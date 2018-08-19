class AddGenderToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :is_male, :boolean, default: true
  end
end
