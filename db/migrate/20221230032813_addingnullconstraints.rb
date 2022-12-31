class Addingnullconstraints < ActiveRecord::Migration[6.1]
  def change
    change_column_null :people, :first_name, false
    change_column_null :people, :last_name, false
    change_column_null :addresses, :street, false
    change_column_null :addresses, :town, false
    change_column_null :addresses, :zip_code, false
    change_column_null :emails, :email_address, false
    change_column_null :phone_numbers, :phone_number, false
  end
end
