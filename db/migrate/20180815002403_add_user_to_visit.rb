class AddUserToVisit < ActiveRecord::Migration[5.1]
  def change
    add_reference :visits, :user, foreign_key: true
  end
end
