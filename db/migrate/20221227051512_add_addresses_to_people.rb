class AddAddressesToPeople < ActiveRecord::Migration[6.1]
  def change
    add_reference :people, :addresses, null: false, foreign_key: true
  end
end
