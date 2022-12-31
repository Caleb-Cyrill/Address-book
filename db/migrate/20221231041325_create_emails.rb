class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.string :email
      t.string :comments
      t.string :person_id

      t.timestamps
    end
    add_index :emails, :person_id
  end
end
