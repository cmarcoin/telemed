class AddPharmacistToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :pharmacist, foreign_key: true
  end
end
