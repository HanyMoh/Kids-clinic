class AddTurnNumToVisit < ActiveRecord::Migration[5.1]
  def change
    add_column :visits, :turn_num, :integer
  end
end
