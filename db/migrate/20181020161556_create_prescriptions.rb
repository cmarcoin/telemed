class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.references :user, foreign_key: true
      t.text :symptoms

      t.timestamps
    end
  end
end
