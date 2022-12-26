class AddPeopleIdToEmails < ActiveRecord::Migration[6.1]
  def change
    add_column :emails, :people_id, :integer
    add_index :emails, :people_id
  end
end
