class Addnotnullconstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null :phone_numbers, :phonenumber, false
  end
end
