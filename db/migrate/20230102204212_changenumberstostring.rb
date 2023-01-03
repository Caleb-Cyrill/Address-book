class Changenumberstostring < ActiveRecord::Migration[6.1]
  def change
    change_column :phone_numbers, :phonenumber, :string
  end
end
