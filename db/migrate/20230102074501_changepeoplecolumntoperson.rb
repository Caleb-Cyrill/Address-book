class Changepeoplecolumntoperson < ActiveRecord::Migration[6.1]
  def change
    rename_column :phone_numbers, :people_id, :person_id
    rename_column :addresses, :people_id, :person_id
  end
end
