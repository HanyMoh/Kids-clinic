class AddCodeToVisit < ActiveRecord::Migration[5.1]
  def change
    add_column :visits, :code, :integer
  end
end
