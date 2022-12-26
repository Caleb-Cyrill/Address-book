class AddPeopleIdToPhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    add_column :phone_numbers, :people_id, :integer
    add_index :phone_numbers, :people_id
  end
end
