class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :address_line1, :text
    add_column :users, :address_city, :string
    add_column :users, :address_postal_code, :string
    add_column :users, :country, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :weight, :float
    add_column :users, :size, :integer
  end
end
