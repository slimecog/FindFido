class AddStreetAddressToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string
  end
end
