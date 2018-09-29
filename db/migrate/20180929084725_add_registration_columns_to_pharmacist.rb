class AddRegistrationColumnsToPharmacist < ActiveRecord::Migration[5.2]
  def change
    add_column :pharmacists, :first_name, :string
    add_column :pharmacists, :last_name, :string
    add_column :pharmacists, :address, :string
    add_column :pharmacists, :phone_number, :string
    add_column :pharmacists, :latitude, :float
    add_column :pharmacists, :longitude, :float
    add_column :pharmacists, :address_line1, :text
    add_column :pharmacists, :address_city, :string
    add_column :pharmacists, :address_postal_code, :string
    add_column :pharmacists, :country, :string
    add_column :pharmacists, :business_tax_id, :string
    add_column :pharmacists, :day_of_birth, :integer
    add_column :pharmacists, :month_of_birth, :integer
    add_column :pharmacists, :year_of_birth, :integer
    add_column :pharmacists, :rpps, :string
    add_column :pharmacists, :adeli, :string
  end
end
