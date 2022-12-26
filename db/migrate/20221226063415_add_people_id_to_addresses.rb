class AddPeopleIdToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :people_id, :integer
    add_index :addresses, :people_id
  end
end
