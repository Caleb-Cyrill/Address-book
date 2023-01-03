class Changecolumnname < ActiveRecord::Migration[6.1]
  def change
    rename_column :phone_numbers, :phonenumber, :phone_number
  end
end
